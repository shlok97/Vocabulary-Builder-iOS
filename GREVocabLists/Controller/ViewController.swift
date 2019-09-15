//
//  ViewController.swift
//  GREVocabLists
//
//  Created by Shlok Kapoor on 20/07/19.
//  Copyright © 2019 Shlok. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var vocabListsTableView: UITableView!
    
    var lists = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        vocabListsTableView.dataSource = self
        vocabListsTableView.delegate = self
        // Do any additional setup after loading the view.
        
        var count = 0
        for _ in WordLists.wL.lists {
            count += 1
            lists.append("Word List \(count)")
        }
        vocabListsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = vocabListsTableView.dequeueReusableCell(withIdentifier: "vocabListCell") {
            cell.textLabel?.text = lists[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "openListSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openListSegue" {
            if let wordVC = segue.destination as? WordViewController {
                if let listNo = sender as? Int {
                    wordVC.wordListNo = listNo
                }
            }
        }
    }
}

