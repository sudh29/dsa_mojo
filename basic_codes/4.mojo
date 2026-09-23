# Structs and Higher-Level Operations

struct User:
    var name: String
    var birth_year: Int

    def __init__(out self, name: String, birth_year: Int):
        self.name = name
        self.birth_year = birth_year

    def age(self, current_year: Int) -> Int:
        return current_year - self.birth_year

def area_circle(r: Float64) -> Float64:
    return 3.141592653589793 * r * r

def main():
    var user0 = User("Sudhanshu Chaudhary", 1993)
    print("User:", user0.name, "Birth Year:", user0.birth_year)
    print("Age in 2026:", user0.age(2026))

    var radii = List[Float64]()
    radii.append(1.0); radii.append(2.0); radii.append(3.0); radii.append(4.0)
    print("Circle areas:")
    for i in range(len(radii)):
        print("Radius", radii[i], "-> Area:", area_circle(radii[i]))
