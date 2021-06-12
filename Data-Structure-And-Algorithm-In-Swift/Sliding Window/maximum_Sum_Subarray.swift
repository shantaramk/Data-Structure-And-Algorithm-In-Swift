//: [Previous](@previous)

import Foundation


/// Max Sum Subarray of size K
///https://practice.geeksforgeeks.org/problems/max-sum-subarray-of-size-k5313/1

func maximumSumSubarray(for array: [Int], windowSize: Int) -> Int {
    
    var i = 0
    var j = 0
    let n = array.count
    
    var maxSum = 0
    
    while j<n {
        
        var temp = 0
        let currentWindow = j-i+1;
        let element = array[j]
        
        if currentWindow < windowSize {
            maxSum += element
            j+=1
        } else if currentWindow == windowSize {
            if i-1>=0 {
                let old_element = array[i-1]
                temp = maxSum - old_element
                temp += element
                if temp > maxSum {
                    maxSum = temp
                }
            } else {
                maxSum += element
            }
            i+=1
            j+=1
        }
    }
    return maxSum
}

print(maximumSumSubarray(for: [100, 200, 300, 400], windowSize: 2))
print(maximumSumSubarray(for: [100, 200, 300, 400], windowSize: 4))
