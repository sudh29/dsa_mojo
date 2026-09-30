#!/usr/bin/env python3
"""Automated Test Runner for dsa_mojo.

Discovers and executes all Mojo DSA problems, verifying compilation,
runtime execution, and unit assertions.
"""

from __future__ import annotations

import argparse
import glob
import os
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Run test suite for Mojo DSA repository."
    )
    parser.add_argument(
        "--category",
        "-c",
        type=str,
        default=None,
        help="Run only tests in the specified category directory (e.g., '1_array')",
    )
    parser.add_argument(
        "--workers",
        "-w",
        type=int,
        default=os.cpu_count() or 4,
        help=f"Number of parallel workers (default: {os.cpu_count() or 4})",
    )
    parser.add_argument(
        "--verbose",
        "-v",
        action="store_true",
        help="Print verbose execution details for each test",
    )
    parser.add_argument(
        "--warn-error",
        action="store_true",
        help="Treat compiler warnings as test failures",
    )
    return parser.parse_args()


def test_single_file(filepath: str, warn_error: bool) -> tuple[str, bool, float, str, str]:
    start = time.perf_counter()
    try:
        res = subprocess.run(
            ["uv", "run", "mojo", "-I", ".", filepath],
            capture_output=True,
            text=True,
            timeout=60,
        )
        elapsed = time.perf_counter() - start
        stderr = res.stderr.strip()
        has_warning = bool(stderr) and "warning:" in stderr.lower()
        passed = (res.returncode == 0) and not (warn_error and has_warning)
        return filepath, passed, elapsed, res.stdout.strip(), stderr
    except subprocess.TimeoutExpired:
        elapsed = time.perf_counter() - start
        return filepath, False, elapsed, "", "Execution timed out after 60s"
    except Exception as e:
        elapsed = time.perf_counter() - start
        return filepath, False, elapsed, "", str(e)


def main() -> int:
    args = parse_args()
    if args.category:
        files = sorted(glob.glob(f"{args.category}/*.mojo"))
    else:
        # Include canonical module files and explicit unit test directory, excluding package library internals
        all_files = sorted(glob.glob("*/*.mojo"))
        files = [f for f in all_files if not f.startswith("dsa/")]
        if os.path.exists("tests"):
            files.extend(sorted(glob.glob("tests/*.mojo")))

    if not files:
        print(f"Error: No .mojo files found matching pattern '{pattern}'", file=sys.stderr)
        return 1

    print(f"🚀 Running {len(files)} Mojo tests across {args.workers} workers...")
    start_total = time.perf_counter()

    passed_count = 0
    failed_results: list[tuple[str, str, str]] = []
    warning_results: list[tuple[str, str]] = []

    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(test_single_file, f, args.warn_error): f for f in files
        }
        for future in as_completed(futures):
            f, passed, elapsed, stdout, stderr = future.result()
            if passed:
                passed_count += 1
                if args.verbose:
                    print(f"  [PASS] {f:<55} ({elapsed:.2f}s)")
            else:
                failed_results.append((f, stdout, stderr))
                print(f"  [FAIL] {f:<55} ({elapsed:.2f}s)")

            if stderr and "warning:" in stderr.lower():
                warning_results.append((f, stderr))

    total_time = time.perf_counter() - start_total

    print("\n" + "=" * 60)
    print(f"Test Execution Summary:")
    print(f"  Total Files Run   : {len(files)}")
    print(f"  Passed            : {passed_count}")
    print(f"  Failed            : {len(failed_results)}")
    print(f"  Compiler Warnings : {len(warning_results)}")
    print(f"  Total Duration    : {total_time:.2f}s")
    print("=" * 60)

    if failed_results:
        print("\n❌ Failed Tests Detail:")
        for f, stdout, stderr in failed_results:
            print(f"\n--- FAIL: {f} ---")
            if stderr:
                print(f"STDERR:\n{stderr}")
            if stdout:
                print(f"STDOUT:\n{stdout}")
        return 1

    if warning_results and args.warn_error:
        print("\n⚠️ Warnings treated as errors:")
        for f, stderr in warning_results:
            print(f"\n--- WARN: {f} ---")
            print(stderr)
        return 1

    print("\n✅ All tests passed successfully!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
