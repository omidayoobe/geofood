//
//  LeftViewController.swift
//  GeoFood
//
//  Created by Wojciech Tyziniec on 20/02/2018.
//  Copyright © 2018 Goldsmiths, University of London. All rights reserved.
//

import UIKit
import Eureka
import CoreLocation

class LeftViewController:  FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            if !row.isValid {
                cell.titleLabel?.textColor = .red
            }
        }
        
        form = Section("Menu")
            <<< SegmentedRow<String>("segments"){
                $0.options = ["History", "Add Products"]
            }
            +++ Section(){
                $0.tag = "history"
                $0.hidden = "$segments != 'History'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< LabelRow(){
                $0.title = "Product 1"
            }
            
            <<< LabelRow(){
                $0.title = "Product 2"
            }
            +++ Section(){
                $0.tag = "products"
                $0.hidden = "$segments != 'Add Products'"
            }
            <<< TextRow(){ row in
                row.title = "Product name:"
                row.placeholder = "Enter product name"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                }
                .cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }
                }
                .onRowValidationChanged { cell, row in
                    let rowIndex = row.indexPath!.row
                    while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                        row.section?.remove(at: rowIndex + 1)
                    }
                    if !row.isValid {
                        for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                            let labelRow = LabelRow() {
                                $0.title = validationMsg
                                $0.cell.height = { 30 }
                                $0.cell.contentView.backgroundColor = .red
                                $0.cell.textLabel?.textColor = .white
                                $0.cell.textLabel?.font = UIFont.boldSystemFont(ofSize:13)
                                $0.cell.textLabel?.textAlignment = .right
                            }
                            row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                        }
                    }
            }
            
            <<< TextRow(){ row in
                row.title = "Type:"
                row.placeholder = "Enter product type"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                }
                .cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }
                }
                .onRowValidationChanged { cell, row in
                    let rowIndex = row.indexPath!.row
                    while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                        row.section?.remove(at: rowIndex + 1)
                    }
                    if !row.isValid {
                        for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                            let labelRow = LabelRow() {
                                $0.title = validationMsg
                                $0.cell.height = { 30 }
                                $0.cell.contentView.backgroundColor = .red
                                $0.cell.textLabel?.textColor = .white
                                $0.cell.textLabel?.font = UIFont.boldSystemFont(ofSize:13)
                                $0.cell.textLabel?.textAlignment = .right
                            }
                            row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                        }
                    }
            }
            
            <<< IntRow(){
                $0.title = "Quantity:"
                $0.placeholder = "Enter quantity"
                $0.add(rule: RuleGreaterThan(min: 1))
                $0.add(rule: RuleSmallerThan(max: 9999))
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnChange
                }
                .cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }
                }
                .onRowValidationChanged { cell, row in
                    let rowIndex = row.indexPath!.row
                    while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                        row.section?.remove(at: rowIndex + 1)
                    }
                    if !row.isValid {
                        for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                            let labelRow = LabelRow() {
                                $0.title = validationMsg
                                $0.cell.height = { 30 }
                                $0.cell.contentView.backgroundColor = .red
                                $0.cell.textLabel?.textColor = .white
                                $0.cell.textLabel?.font = UIFont.boldSystemFont(ofSize:13)
                                $0.cell.textLabel?.textAlignment = .right
                            }
                            row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                        }
                    }
            }
            
            <<< DateTimeInlineRow("Date:") {
                $0.title = $0.tag
                $0.value = Date()
                $0.disabled = true
            }
            <<< LocationRow(){
                $0.title = "Location:"
                $0.value = CLLocation(latitude: -34.91, longitude: -56.1646)
            }
            <<< PickerInlineRow<String>(){
                $0.title = "Store:"
                $0.options = ["Store1","Store2","Store3", "Store4", "Store5"]
                $0.value = "Select Store"    // initially shown
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnChange
                }
                .cellUpdate { cell, row in
                    if !row.isValid {
                        cell.textLabel?.textColor = .red
                    }
                }
                .onRowValidationChanged { cell, row in
                    let rowIndex = row.indexPath!.row
                    while row.section!.count > rowIndex + 1 && row.section?[rowIndex  + 1] is LabelRow {
                        row.section?.remove(at: rowIndex + 1)
                    }
                    if !row.isValid {
                        for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                            let labelRow = LabelRow() {
                                $0.title = validationMsg
                                $0.cell.height = { 30 }
                                $0.cell.contentView.backgroundColor = .red
                                $0.cell.textLabel?.textColor = .white
                                $0.cell.textLabel?.font = UIFont.boldSystemFont(ofSize:13)
                                $0.cell.textLabel?.textAlignment = .right
                            }
                            row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                        }
                    }
                    
                    
                    
                    
            }
            <<< ButtonRow() {
                $0.title = "Add"
                }
                .onCellSelection { cell, row in
                    row.section?.form?.validate()
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
