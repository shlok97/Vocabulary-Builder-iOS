//
//  CompleteViewController.swift
//  GREVocabLists
//
//  Created by Shlok Kapoor on 20/07/19.
//  Copyright © 2019 Shlok. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func done(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
