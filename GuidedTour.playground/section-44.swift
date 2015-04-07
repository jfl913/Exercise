numbers.map({
    (number: Int) -> Int in
    if (number % 2 == 0){
        let result = 3 * number
        return result
    }else{
        let result = 0
        return result
    }
//    let result = 3 * number
//    return result
})
