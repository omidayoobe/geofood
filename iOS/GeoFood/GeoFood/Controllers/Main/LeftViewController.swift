//
//  LeftViewController.swift
//  GeoFood
//
//  Created by Wojciech Tyziniec on 20/02/2018.
//  Copyright © 2018 Goldsmiths, University of London. All rights reserved.
//

import UIKit
import Eureka

class LeftViewController:  FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("Product Details")
            <<< TextRow(){ row in
                row.title = "Product name"
                row.placeholder = "Enter product name"
            }
            <<< PhoneRow(){
                $0.title = "Quantity"
                $0.placeholder = "Add quantity"
        }
        }
        // Do any additional setup after loading the view.
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        print("Left view did appear")
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
