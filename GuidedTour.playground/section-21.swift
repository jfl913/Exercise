var optionalString: String? = "Hello JFL"
optionalString == nil

var optionalName: String? = "John Appleseed"
//optionalName = nil
var greeting = "Hello!"
if let name = optionalString {
    greeting = "Hello, \(name)"
    greeting = "Hello, \(optionalString)"
}else{
    let testName = optionalString
    greeting = "Hello, \(optionalString)"
}
