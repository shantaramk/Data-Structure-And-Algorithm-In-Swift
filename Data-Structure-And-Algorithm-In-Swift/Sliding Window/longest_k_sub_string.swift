//: [Previous](@previous)

import Foundation


/// Longest K unique characters substring
/// https://practice.geeksforgeeks.org/problems/longest-k-unique-characters-substring0853/1


func longestKSubString(for inputString: String , kSum: Int) -> Int {
    
    var i = 0
    
    var j = 0;
    let n = inputString.count
    let strArr = Array(inputString)
    var dict = [Character: Int]()
    
    while j < n {
        let char = strArr[j]
        
        let value = dict[char]
        if value == nil {
            dict[char] = 1
        } else {
            dict[char] = value! + 1
        }
        if dict.count > kSum {
            
            ///  Get index of longest sub string
            let tempLength = j-1
            print("i:j = ", i, tempLength, tempLength - i+1)

            // make dict count to kSum
            
            while dict.count != kSum {
                let old_char = strArr[i]
                
                let value = dict[old_char]! - 1
                if value == 0 {
                    /// remove key from dictionary
                    dict[old_char] = nil
                } else {
                    dict[old_char] = value
                }
                i+=1
            }
        }
        j+=1

    }
    if dict.count == kSum {
        ///  Get index of longest sub string
        let tempLength = j-1
        print("i:j = ", i, tempLength, tempLength - i+1)
    }

    return 0
}

print(longestKSubString(for: "abcbdbdbbdcdabd", kSum: 5))
