//: [Previous](@previous)

import Foundation

/// find Largest SubArray For K sum

func findLargestSubArray(for array: [Int], kSum: Int) -> Int {
    
    var i = 0
    
    var j = 0;
    let n = array.count
    var sum = 0
    var maxLength = -1
    while j < n {
        
        sum = sum + array[j]
        if sum < kSum {
            j += 1

        } else if sum == kSum {
            let temp = j - i + 1
            if maxLength == -1 {
                maxLength = temp
            }
            if temp > maxLength {
                maxLength = temp
            }
            sum = 0
            i+=1;
            j = i;
        } else if sum > kSum {
            sum = 0
            i+=1;
            j = i;
        }
    }
    return maxLength
}
print(findLargestSubArray(for: [4,3,1,2,5,3,1,1], kSum: 5))
