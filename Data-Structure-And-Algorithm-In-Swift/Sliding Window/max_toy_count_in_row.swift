//: [Previous](@previous)

import Foundation


/// Pick Toys | An Interesting Sliding Window Problem
/// John is at a toy store help him pick maximum number of toys.
/// He can only select in a continuous manner and he can select only two types of toys.
/// https://www.youtube.com/watch?v=seOKHXB_w74&list=PL_z_8CaSLPWeM8BDJmIYDaoQ5zuwyxnfj&index=12

/// 0 1 2 3 4 5 6 7
/// a b c a b c b b
/// maxLength =  4
/// o/p : b c b b
///
/// 0 1 2 3 4 5 6 7 9
/// a b c a b z c b b
/*
 0 - 5
 1- 4
 2 - 3
 3 - 2
4 - 5
 
 
 */
func longestSubStringWithHighestToysCount(for inputString: String, k: Int) -> Int {
    
    var i = 0
    var j = 0;
    let n = inputString.count
    let strArr = Array(inputString)
    var dict = [Character: Int]()
    
    var maxLength = -1
    var maxToys = -1
    
    while(j<n) {
        let char = strArr[j]
        var value = dict[char] ?? 0
        value+=1
        dict[char] = value
        
        if dict.count == k+1 {
            
            while dict.count != k {
                let first_char = strArr[i]
                let value = dict[first_char]! - 1
                if value == 0 {
                    dict[first_char] = nil
                } else{
                    dict[first_char] = value
                }
                i+=1
            }
        }
        /// Get MAX Length
        let tempLength = (j-i+1)
        if maxLength == -1 {
            maxLength = tempLength
        } else if tempLength > maxLength {
            maxLength = tempLength
        }
        
        /// Get MAX Toys Count
        let tempToys = dict.reduce(0, { x, dict in
            x + dict.value
        })
        if tempToys > maxToys {
            maxToys = tempToys
        }
        
        j+=1
    }
   
    return maxToys
}
//print(longestSubStringWithHighestToysCount(for: "abcabcbb", k: 2))
//print(longestSubStringWithHighestToysCount(for: "abcabzcbb", k: 3))
