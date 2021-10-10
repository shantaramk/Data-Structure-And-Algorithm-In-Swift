//: [Previous](@previous)

import Foundation


/// Longest K unique characters substring
/// https://leetcode.com/problems/longest-substring-without-repeating-characters/


// 0 1 2 3 4 5 6 7
// a b c a b c b b

func longestSubString(for inputString: String) -> Int {
    
    var i = 0
    var j = 0;
    let n = inputString.count
    let strArr = Array(inputString)
    var dict = [Character: Int]()
    
    var maxLength = -1
    
    while(j<n) {
        let char  = strArr[j]
        var value = dict[char] ?? 0
        value += 1
        dict[char] = value

        if value == 2 {
            //left Pop
            
            while(i<j) {
                let first_char = strArr[i]
                
                let value = dict[first_char]!
                
                if value == 2 {
                    dict[first_char] = 1
                }
                i+=1
            }
            
        } else {
            
            let tempLength = j-i+1
            
            if tempLength > maxLength {
                maxLength = tempLength
            }
        }
        j+=1
    }
   
    return maxLength
}

print(longestSubString(for: "abcabcbb"))
