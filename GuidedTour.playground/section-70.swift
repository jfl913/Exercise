enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    func color() -> String{
        switch self {
        case .Spades:
            return "black"
        case .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
//        case .Diamonds:
//            return "red"
        }
    }
}
let hearts = Suit.Diamonds
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()
