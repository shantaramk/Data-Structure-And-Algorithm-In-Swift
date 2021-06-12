//: [Previous](@previous)

import Foundation

/// find count occurrences of anagram
///https://practice.geeksforgeeks.org/problems/count-occurences-of-anagrams5839/1

func occurrencesCount(for text: String, pattern: String) -> Int {
    var textDict = [Character: Int]()
    var patternDict = [Character: Int]()
    
    let characters = Array(text)
    
    var i = 0
    var j = 0
    let windowSize = pattern.count
    let n = text.count
    
    var count = 0
    
    for char in pattern {
        let value = patternDict[char]
        if value != nil {
            patternDict[char] = value! + 1
        } else {
            patternDict[char] = 1
        }
    }
    while j<n {
        
        let currentWindow = j-i+1;
        
        let element = characters[j]
        
        let value = textDict[element]
        if value != nil {
            textDict[element] = value! + 1
        } else {
            textDict[element] = 1
        }
        
        if currentWindow < windowSize {
            j+=1;
        } else if currentWindow == windowSize {
            
            if i>0 {
                let old_element = characters[i-1];
                
                let value = textDict[old_element]
                if value! > 1 {
                    textDict[old_element] = value! - 1
                } else {
                    textDict[old_element] = nil
                }
            }
            if textDict == patternDict {
                print("Both Equal");
                count+=1
            }
            i+=1;
            j+=1;
        }
    }
    return count

}


print(occurrencesCount(for: "aabaabaa", pattern: "aaba"))
print(occurrencesCount(for: "forxxorfxdofr", pattern: "for"))
