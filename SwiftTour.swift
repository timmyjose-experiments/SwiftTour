// comments are as in other C-like languages
print("Hello, world!")

// `let` for constants and `var` for variables
var myVariable = 42
print(myVariable)
myVariable = 21
print(myVariable)

let myConstant = 12345
print(myConstant)
//myConstant = 54321

let implicitInteger = 42
let explicitInteger: Int = 42
let implicitDouble = 3.14159
let explicitDouble: Double = 3.14159

let myFloat: Float = 4
print(myFloat)

// no implicit conversions
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)