//
//  MainViewController.swift
//  SnapchatSwipeView
//
//  Created by Wojciech Tyziniec on 20/02/2018.
//  Copyright © 2018 Brendan Lee. All rights reserved.
//

import UIKit
class MainViewController: UIViewController {
    @IBOutlet weak var centerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if centerLabel.text != nil {
            print("contains value")
            centerLabel.text = "hello world"
        } else {
            print("empty")
        }
        //self.centerLabel.text? = "asd"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
