func insertionSort(_ list: [Int]) -> [Int] {
    var sorted: [Int] = []
    list.forEach {
        sorted = insert2(sorted, $0)
    }
    return sorted
}

// O(n^2) solution
func insert1(_ sorted: [Int], _ item: Int) -> [Int] {
    var list = sorted
    for i in 0..<list.count where item <= list[i] {
        list.insert(item, at: i)
        return list
    }
    list.append(item)
    return list
}

// O(nlogn) solution
func insert2(_ sorted: [Int], _ item: Int) -> [Int] {
    var list = sorted
    if list.count == 0 {
        list.append(item)
        return list
    }
    
    var startIndex = 0
    var endIndex = list.count
    repeat {
        let currentIndex = (endIndex - startIndex) / 2 + startIndex
        let currentItem = list[currentIndex]
        if item <= currentItem {
            endIndex = currentIndex
        }
        if item > currentItem {
            startIndex = currentIndex + 1
        }
    } while startIndex != endIndex
    list.insert(item, at: endIndex)
    return list
}

print(insertionSort([42,600,4,1,7,8,4,6,22,3])) // [1, 3, 4, 4, 6, 7, 8, 22, 42, 600]

//print(insert2([1, 4, 4, 7, 8, 42, 600], 6))
//print(insert2([1, 4, 4], 6))

//print(insert2([1], 2))
