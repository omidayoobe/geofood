//
//  TopViewController.swift
//  GeoFood
//
//  Created by Wojciech Tyziniec on 20/02/2018.
//  Copyright © 2018 Goldsmiths, University of London. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load, top")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View did appear, top")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
