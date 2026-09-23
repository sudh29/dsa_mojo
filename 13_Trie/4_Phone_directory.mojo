# Phone Directory (Autocomplete with Trie / Prefix matching)

def starts_with(word: String, prefix: String) -> Bool:
    if word.byte_length() < prefix.byte_length():
        return False
    var w_bytes = word.as_bytes()
    var p_bytes = prefix.as_bytes()
    for i in range(prefix.byte_length()):
        if w_bytes[i] != p_bytes[i]:
            return False
    return True

def sort_and_unique(words: List[String]) -> List[String]:
    var arr = List[String]()
    for i in range(len(words)):
        arr.append(words[i])
    for i in range(len(arr)):
        for j in range(i + 1, len(arr)):
            if arr[j] < arr[i]:
                var temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
                
    var unique = List[String]()
    for i in range(len(arr)):
        if i == 0 or arr[i] != arr[i - 1]:
            unique.append(arr[i])
    return unique^

def display_contacts(n: Int, contact: List[String], s: String) -> List[List[String]]:
    var contacts = sort_and_unique(contact)
    var results = List[List[String]]()
    
    var prefix = String("")
    for i in range(s.byte_length()):
        prefix += s[byte=i]
        var matches = List[String]()
        for j in range(len(contacts)):
            if starts_with(contacts[j], prefix):
                matches.append(contacts[j])
        if len(matches) == 0:
            var no_match = List[String]()
            no_match.append("0")
            results.append(no_match^)
        else:
            results.append(matches^)
            
    return results^

def main():
    var contacts = List[String]()
    contacts.append("geeikistest")
    contacts.append("geeksforgeeks")
    contacts.append("geeksfortest")
    var s = String("geeips")
    
    var res = display_contacts(len(contacts), contacts, s)
    print("Phone directory search results:")
    for i in range(len(res)):
        print("Prefix", s[byte=0:i+1], ":", end=" ")
        for j in range(len(res[i])):
            print(res[i][j], end=" ")
        print()
