import UIKit

var str = "Hello, playground"

//3 cas


//Init après déclaration
var greetings: String

if str.contains("M.") {
    greetings = "Toto"
}

//greetings.uppercased()

let a = 5
let b = 2
let c = Float(a) / Float(b)




struct Dog {
    let name: String
    var age: Int
}

struct Owner {
    let name: String

    func call() {
        print("Call called")
    }
}

class Cat {
    let name: String
    var age: Int
    let colour: String

//    var owner: Optional<Owner>
    var owner: Owner?

    init(name: String) {
        self.name = name
        age = 10
        colour = "Blue"
    }

    init(name: String, age: Int = 0, colour: String) {
        self.name = name
        self.age = age
        self.colour = colour
    }
}

let myCat = Cat(name: "Félix")
let cat2 = myCat
myCat.age = 2
print(cat2.age)
print(myCat.age)

var myDog = Dog(name: "Médor", age: 0)
let dog2 = myDog
myDog.age = 2

print(dog2.age)
print(myDog.age)

//: ## Optionals

//myCat.owner = Owner(name: "Ludovic")

//force unwrapping
//print(myCat.owner!)

//Test simple
if myCat.owner != nil {
    print("My cat owner is me: \(myCat.owner!)")
}

//Optional binding
if let owner = myCat.owner {
    print("My cat owner is me: \(owner)")
} else {
    print("Wild cat")
//    fatalError("A cat is not supposed to be wild")
}

//Optional chaining
myCat.owner?.call()

if let ownerName = myCat.owner?.name {
    
}



//Nil coalescing operator (prend un optionnel ou une valeur par défaut)
let ownerName = myCat.owner?.name ?? "No owner"

enum FormError: Error {
    case noText
    case textTooLong
    case textTooShort
    case noAuthor
}

struct Form {
    var text: String
    var authorName: String?

    init(text: String) {
        self.text = text
    }

    func validate2() -> String? {

        guard let author = authorName else {
            return nil
        }

        guard !text.isEmpty else {
            return nil
        }

        guard text.count > 5 else {
            return nil
        }

        guard text.count < 50 else {
            return nil
        }

        // on valide
        return "\(author) wrote : \(text)"
    }

    func validate() throws -> String {

        guard let author = authorName else {
            throw FormError.noAuthor
        }

        guard !text.isEmpty else {
            throw FormError.noText
        }

        guard text.count > 5 else {
            throw FormError.textTooShort
        }

        guard text.count < 50 else {
            throw FormError.textTooLong
        }

        // on valide
        return "\(author) wrote : \(text)"
    }
}

let testForm = Form(text: "")

// Error with do-catch
do {
    let validatedForm = try testForm.validate()
    print(validatedForm)
} catch FormError.noText {
    print("The form is empty")
} catch {
    print(error)
}

//Treat as optional
if let validated = try? testForm.validate() {
    print(validated)
}

//An error? What is an error?
//let validated2 = try! testForm.validate()

//: ## Functions

func eat(_ food: String, with friend: String) {
    print(food)
    print(friend)
}

eat("Pizza", with: "Paul")

var tab = ["a", "b"]
tab.insert("c", at: 0)
tab.remove(at: 0)

struct Food {}
struct Dirt {}

func cook(ingredients: [Food]) -> (cookedFood: Food?, dirt: Dirt?) {

    guard !ingredients.isEmpty else { return (nil, nil) }
    return (Food(), Dirt())
}

let (food, dirt) = cook(ingredients: [])
let result = cook(ingredients: [])
result.cookedFood

tab.sort { (s1, s2) -> Bool in
    s1.count < s2.count
}


func delay(seconds: Int, code: @escaping () -> () ) {

    //wait x seconds
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
        code()
    }
}


delay(seconds: 10) {
    print("Heeeyyyy")
}
