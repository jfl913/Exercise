class Shape {
    var numberOfSides = 0
    let name = "jfl"
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func welcomeName(namePeople: String) -> String{
        return "Welcome " + namePeople + " " + name
    }
}
