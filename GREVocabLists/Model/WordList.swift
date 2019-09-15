//
//  WordList.swift
//  GREVocabLists
//
//  Created by Shlok Kapoor on 20/07/19.
//  Copyright © 2019 Shlok. All rights reserved.
//

import Foundation

class WordList {
    
    // True: I know the word
    // Initially all will be false
    var data = Dictionary<String, Bool>()
    var total = 0
    var completed = 0
    
    init(listNo: Int) {
        let list = WordLists.wL.lists[listNo]
        for word in list {
            data[word] = false
        }
        total = list.count
        print(data)
    }
    
    func getProgress() -> String {
        return "\(completed) / \(total) Words Complete."
    }
    
    func isComplete() -> Bool {
//        let dictKeys = [String](data.keys)
        let dictValues = [Bool](data.values)
        
        for (value) in dictValues {
            if value == false {
                return false
            }
        }
        return true
    }
    
    func getWordRandom() -> String? {
//        let dictKeys = [String](data.keys)
//        let dictValues = [Bool](data.values)
        let words = self.data.shuffled()
        
        if isComplete() {
            return nil
        }
        
        for word in words {
            if word.value == false {
                return word.key
            }
        }
        
        return nil
    }
    
    func knowRandomWord(word: String) {
        data[word] = true
        completed += 1
    }
}
