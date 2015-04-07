func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

func averageOf(numbers: Float...) -> Float {
    var sum: Float = 0
    var count: Float = 0
    for number in numbers {
        sum += number
        count++
    }
    
    return sum / count;
}

//averageOf()
averageOf(3, 2, 3)
