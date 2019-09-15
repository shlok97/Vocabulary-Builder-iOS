//
//  WordViewController.swift
//  GREVocabLists
//
//  Created by Shlok Kapoor on 20/07/19.
//  Copyright © 2019 Shlok. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var wordView: UIView!
    
    @IBOutlet var wordLabel: UILabel!
    var wordListNo: Int = 0
    
    var list: WordList = WordList(listNo: 0)
    var currentWord = ""
    
    @IBOutlet var progressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        wordView.layer.cornerRadius = 10
        print(wordListNo)
        list = WordList(listNo: wordListNo)
        setRandomWord()
    }
    func setProgressLabel() {
        self.progressLabel.text = list.getProgress()
    }
    func setRandomWord() {
        if let currentWord = list.getWordRandom() {
            self.currentWord = currentWord
            wordLabel.text = currentWord
        } else {
            self.performSegue(withIdentifier: "doneSegue", sender: self)
            print("Done")
        }
        setProgressLabel()
    }
    @IBAction func knowIt(_ sender: Any) {
        list.knowRandomWord(word: currentWord)
        setRandomWord()
        print("Know tapped")
        print(list.data)
    }
    @IBAction func dontKnowAndSkip(_ sender: Any) {
        setRandomWord()
    }
    
    @IBAction func dontKnowIt(_ sender: Any) {
        
        if let url = URL(string: "https://www.google.com/search?q="+currentWord+"+meaning&rlz=1C5CHFA_enIN734IN735&oq=water+mea&aqs=chrome.1.69i57j35i39j0l4.2712j1j1&sourceid=chrome&ie=UTF-8") {
            UIApplication.shared.open(url)
        }
        
        setRandomWord()
        
        
    }
}
