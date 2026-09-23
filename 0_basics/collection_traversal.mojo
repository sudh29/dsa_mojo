# Basic Collection & Testing Demonstrations

def main():
    var items = List[String]()
    items.append("alpha")
    items.append("beta")
    items.append("gamma")
    items.append("delta")

    print("Items count:", len(items))
    for i in range(len(items)):
        print("Item", i, ":", items[i])

    print("Testing complete.")
