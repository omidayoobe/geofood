//
//  TestViewController.swift
//  GeoFood
//
//  Created by Wojciech Tyziniec on 20/02/2018.
//  Copyright © 2018 Goldsmiths, University of London. All rights reserved.
//

import UIKit
import Alamofire

class TestViewController: UIViewController {
    

    let urlString = "http://geofood.uk/backend/register.php"
    // IBOutlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func registerAction(_ sender: UIButton) {
        print(loginTextField.text!)
        print(passwordTextField.text!)
        print(emailTextField.text!)
        
        let parameters: Parameters=[
            "username":loginTextField.text!,
            "password":passwordTextField.text!,
            "email":emailTextField.text!,
        ]
        
        Alamofire.request(urlString, method: .post, parameters: parameters).responseJSON{
            response in
            print(response)
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                self.resultLabel.text = jsonData.value(forKey: "message") as! String?
            }
        }
    }
    
    
    
    
    
    // Swipe down to dismiss the view
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view?.window)
        
        if sender.state == UIGestureRecognizerState.began {
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizerState.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.x - initialTouchPoint.x, width: self.view.frame.size.width, height: self.view.frame.size.height)
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
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
