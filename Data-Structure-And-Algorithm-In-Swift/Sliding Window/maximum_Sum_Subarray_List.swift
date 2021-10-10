//: [Previous](@previous)

import Foundation


/// Max Sum Subarray of size K
///https://afteracademy.com/blog/sliding-window-maximum

func maximumNumberList(for array: [Int], windowSize: Int) -> [Int] {
    
    var sumlist = [Int]()
    var max = array[0];
    for i in stride(from: 0, through: array.count - windowSize, by: 1) {
        for j in stride(from: 0, to: i+windowSize, by: 1) {
            if array[j] > max {
                max = array[j]
            }
        }
        sumlist.append(max)
    }
    return sumlist
}

print(maximumNumberList(for: [4,3,1,2,5,3,4,7,1,9], windowSize: 2))
print(maximumNumberList(for: [4,3,1,2,5,3,4,7,1,9], windowSize: 4))
