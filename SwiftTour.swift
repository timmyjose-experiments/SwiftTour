print("Hello, world!")

var myVariable = 42
print(myVariable)
myVariable = 12
print(myVariable)

let myConstant = 12
print(myConstant)
//myConstant = 21

let implicitIntegr = 1
let explicitInteger: Int = 2
let explicitDouble: Double = 2.78128
print(explicitDouble)

let explicitFloat: Float = 4
print(explicitFloat)

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

let apples = 3
let oranges = 5
print("I have \(apples) apples and \(oranges) oranges")

let name = "Bob"
print("Hello, \(name), here is a value for you: \(2.0 / 1.9)")

let quotation = """
    Even though there's whitespace to the left,
    the actual lines aren't indented.
        Except for this one.
    Double ("") quotes can appear without being escaped.

    I still have \(apples) apples and \(oranges) oranges
    """
print(quotation)

// both arrays and dictionaries use []
var fruits = ["strawberries", "apples", "lychees"]
for fruit in fruits {
    print(fruit)
}
print()

fruits[1] = "grapes"
for fruit in fruits {
    print(fruit)
}
print()

var occupations = [
    "Malcolm" : "Captain",
    "Kaylee": "Mechanic"
]

for (k, v) in occupations {
    print("\(k) => \(v)")
}
print()

occupations["Jayne"] = "Public Relations Officer"

for (name, occupation) in occupations {
    print("\(name) is a \(occupation)")
}
print()

fruits.append("persimmon")
for fruit in fruits {
    print("I love \(fruit)")
}
print()

var emptyArray: [String] = []
var emptyDictionary: [String : Int] = [:]

// control flow

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print("Team score = \(teamScore)")

let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}

print(scoreDecoration)

var optionalString: String?

optionalString = nil
print(optionalString == nil)

if let food = optionalString {
    print("Got a food item: \(food)")
} else {
    print("Got nothing")
}

optionalString = "Mantequilla"
print(optionalString == nil)

if let foodItem = optionalString {
    print("Got a food item: \(foodItem)")
} else {
    print("Got nothing")
}

var nickname: String? = nil
let fullName: String = "John Appleseed"

if let nickname {
    print("We have a nickname: \(nickname)")
} else {
    print("No nickname yet")
}

let formalGreeting = "Hi \(nickname ?? fullName)"
print(formalGreeting)

nickname = "Bob"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)

if let nickname {
    print("We now have a nickname: \(nickname)")
} else {
    print("No nickname even now!")
}

// `switch` - similar to Rust's `match`

let vegetable = "red pepper"

switch vegetable {
case "celery":
    print("Add some raisins to it, and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime" : [2, 3, 5, 7, 11, 13],
    "Fibonacci": [0, 1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
var groupForLargest = "unknown"
for (group, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            groupForLargest = group
        }
    }
}

print("The largest number is: \(largest), which is a \(groupForLargest) number")

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var total = 0
for idx in 0..<6 {
    total += idx
}
print(total)

total = 0
for e in 0...6 {
    total += e
}
print(total)

// functions and closures

func greet(name: String, day: String) -> String {
    return "Hello, \(name), today is \(day)"
}

print(greet(name: "Bob", day:  "Friday"))

func lunchSpecial(name: String, special: String) -> String {
    return "Hello, \(name), today's lunch special is: \(special)"
}

print(lunchSpecial(name: "Dave", special: "Broccoli"))

func greetWithLessPain(_ name: String, on day: String) -> String {
    return "Hello, \(name), today is \(day)"
}

print(greetWithLessPain("Bob", on: "Sushi"))

func calculateStatistics(numbers: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = numbers[0]
    var max = numbers[0]
    var sum = 0

    for number in numbers {
        if number < min {
            min = number
        }

        if number > max {
            max = number
        }

        sum += number
    }

    return (min, max, sum)
}

let stats = calculateStatistics(numbers: [5, 3, 100, 3, 9])
print("Min = \(stats.min), Max = \(stats.max), Sum = \(stats.sum)")

func returnFifteen() -> Int {
    var x = 10
    
    func add() {
        x += 5
    }
    add()

    return x
}

print(returnFifteen())

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(x: Int) -> Int {
        return x + 1
    }

    return addOne
}

var inc = makeIncrementer()

for x in 1...10 {
    print(inc(x))
}

func hasAnyMatches(numbers: [Int], predicate: (Int) -> Bool) -> Bool {
    for number in numbers {
        if predicate(number) {
            return true
        }
    }
    return false
}

func lessThanTen(x: Int) -> Bool {
    return x < 10
}

func greaterThanHundred(n: Int) -> Bool {
    return n > 100
}

let numbers = [20, 19, 7, 21]
print(hasAnyMatches(numbers: numbers, predicate: lessThanTen))
print(hasAnyMatches(numbers: numbers, predicate: greaterThanHundred))

// closures

print(numbers.map({ (n: Int) -> Int in let res = 3 * n; return res }))
print(numbers.map({ (n: Int) -> Int in if n % 2 != 0 { return 0 } else { return n } }))

print(numbers.map({ n in 3 * n }))
print(numbers.map({n in if n % 2 != 0 { return 0 } else { return n }}))

let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)

let reverseSortedNumbers = numbers.sorted { $0 > $1 }
print(reverseSortedNumbers)

// Objects and Classes

class Shape {
    var numberOfSides = 0
    let id = "Shape"

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

var shape = Shape()
print(shape.simpleDescription())
shape.numberOfSides = 7;
print(shape.simpleDescription())

class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String, numberOfSides: Int) {
        self.name = name
        self.numberOfSides = numberOfSides
    }

    deinit {}

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

var namedShape = NamedShape(name: "Octagon", numberOfSides: 8)
print(namedShape.simpleDescription())

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name, numberOfSides: 4)
    }

    func area() -> Double {
        return self.sideLength * self.sideLength
    }

    override func simpleDescription() -> String {
        return "Square"
    }
}

var square = Square(sideLength: 10, name: "A square square")
print(square.area())
print(square.simpleDescription())

class Circle: NamedShape {
    var radius: Double = 0.0

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name, numberOfSides: 0)
    }

    func area() -> Double {
        return Double.pi * self.radius * self.radius
    }

    override func simpleDescription() -> String {
        return "Circle"
    }
}

var circle = Circle(radius: 10.0, name: "my favourite circle")
print(circle.area())
print(circle.simpleDescription())


// Enumerations and Structures

enum Rank: Int, CaseIterable {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace: 
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
print(aceRawValue)

func compareRanks(left: Rank, right: Rank) -> Bool {
    return left.rawValue < right.rawValue
}

enum Suit: CaseIterable {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "Spades"
        case .hearts:
            return "Hearts"
        case .diamonds:
            return "Diamonds"
        case .clubs:
            return "Clubs"
        }
    }

    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "Black"
        default:
            return "Red"
        }
    }
}

let suit = Suit.hearts
print(suit.simpleDescription())
print(suit.color())

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case warning(String, String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")
let warning = ServerResponse.warning("Bob", "don't prevaricate")

func analyseServerResponse(_ serverResponse: ServerResponse) {
    switch serverResponse {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset at \(sunset)")
    case let .failure(message):
        print("Failure... \(message)")
    case let .warning(by, message):
        print("\(by) warns: \(message)")
    }
}

analyseServerResponse(success)
analyseServerResponse(failure)
analyseServerResponse(warning)

// structs are always copied in, unlike classes which are always passed by reference

struct Card {
    var rank: Rank
    var suit: Suit

    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let aceOfSpades = Card(rank: Rank.ace, suit: Suit.spades)
print(aceOfSpades.simpleDescription())

// type inference of the enum variants
let threeOfHearts = Card(rank: .three, suit: .hearts)
print(threeOfHearts.simpleDescription())

func deckOfCards() -> [Card] {
    var deck: [Card] = []

    for rank in Rank.allCases {
        for suit in Suit.allCases {
            deck.append(Card(rank: rank, suit: suit))
        }
    }

    return deck
}

let deck = deckOfCards()
print("Number of cards in a deck = \(deck.count)")

for card in deck {
    print(card.simpleDescription())
}


// concurrency

func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}

func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)

    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}

// Use `Task` to call asynchronous functions from synchronous code, 
// without waiting for them to return

Task {
    await connectUser(to: "primary")
}

Task {
    await connectUser(to: "non-primary")
}


// Protocols and Extensions

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
}

var a = SimpleClass()
a.adjust()
print(a.simpleDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A very simple structure"
    mutating func adjust() {
        simpleDescription += " [adjusted]"
    }
}

var s = SimpleStructure()
s.adjust()
print(s.simpleDescription)

// extensions allow us to add functionality to an arbitrary type

extension Int: ExampleProtocol {
    var simpleDescription: String { 
        return "An Integer: \(self)"
    }

    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)

var seven = 7
seven.adjust()
print(seven.simpleDescription)

protocol HasAbsoluteValue {
    func absoluteValue() -> Self
}

extension Double: HasAbsoluteValue {
    func absoluteValue() -> Self {
        if self < 0 {
            return -self
        }
        return self
    }
}

var myDouble = 2.78128
print(myDouble.absoluteValue())
myDouble = -myDouble
print(myDouble.absoluteValue())


// Error Handling
// `Error` is a protocol

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case isJammed
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has Toner" {
        throw PrinterError.noToner
    }
    return "Job Sent"
}

do {
    let printerResponse = try send(job: 101, toPrinter: "Never has Toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    print(try send(job: 123, toPrinter: "Some innocent printer"))
} catch {
    print(error)
}

var fridgeIsOpen = false
var fridgeContents = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true

    defer {
        fridgeIsOpen = false
    }

    return fridgeContents.contains(food)
}

if fridgeContains("banana") {
    print("We have bananas")
} else {
    print("We don't have bananas")
}

print(fridgeIsOpen)


// Generics

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var items: [Item] = []

    for _ in 0..<numberOfTimes {
        items.append(item)
    }
    return items
}

let items = makeArray(repeating: "Hello", numberOfTimes: 2)

for item in items {
    print(item)
}

enum MyOptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var integer: MyOptionalValue<Int> = .none
print(integer)

integer = .some(42)
print(integer)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

print(anyCommonElements([1, 2, 3], [4]))
print(anyCommonElements([1, 2, 3], [3]))

func getCommonElements<T, U>(_ lhs: T, _ rhs: U) -> [T.Element]
    where 
        T: Sequence,
        T.Element: Equatable,
        U: Sequence,
        U.Element: Equatable,
        T.Element == U.Element {
            var res: [T.Element] = []

            for lhsItem in lhs {
                for rhsItem in rhs {
                    if lhsItem == rhsItem {
                        res.append(lhsItem)
                    }
                }
            }
            return res
        }

var commonItems = getCommonElements([1, 2, 3, 4, 5], [2, 5])
print(commonItems)
commonItems = getCommonElements([1, 2, 3, 4, 5], [8, 9, 10, 11])
print(commonItems)
