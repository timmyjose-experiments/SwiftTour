import Foundation

if let xInput = readLine(), let x = Int(xInput) {
    if let yInput = readLine(), let y = Int(yInput) {
        let sum = x + y
        print("\(x) + \(y) = \(sum)")
    } else {
        print("second number is invalid")
    }
} else {
    print("first number is invalid")

}
