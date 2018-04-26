//
//  ChooseRoleViewController.swift
//  GeoFood
//
//  Created by Wojciech Tyziniec on 25/02/2018.
//  Copyright © 2018 Goldsmiths, University of London. All rights reserved.
//

import UIKit

class ChooseRoleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func skipButtonPressed(_ sender: Any) {
        let mainSb = UIStoryboard(name: "Main", bundle: nil)
         let left = mainSb.instantiateViewController(withIdentifier: "left")
         let middle = mainSb.instantiateViewController(withIdentifier: "middle")
         let right = mainSb.instantiateViewController(withIdentifier: "right")
         let top = mainSb.instantiateViewController(withIdentifier: "top")
         let snapContainer = SnapContainerViewController.containerViewWith(left, middleVC: middle, rightVC: right, topVC: top)
         self.present(snapContainer, animated: true, completion: nil)
    }
    
    // Swipe down to dismiss the view
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view?.window)
        
        if sender.state == UIGestureRecognizerState.began {
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizerState.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        } else if sender.state == UIGestureRecognizerState.ended || sender.state == UIGestureRecognizerState.cancelled {
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    
    

}
