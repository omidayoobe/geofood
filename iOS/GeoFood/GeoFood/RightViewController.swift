//
//  RightViewController.swift
//  SnapchatSwipeView
//
//  Created by Wojciech Tyziniec on 20/02/2018.
//  Copyright © 2018 Brendan Lee. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {
    @IBOutlet weak var rightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightLabel.text = "right view"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
