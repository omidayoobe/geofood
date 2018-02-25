//
//  ViewController.swift
//  GeoFood
//
//  Created by Wojciech Tyziniec on 22/02/2018.
//  Copyright © 2018 Goldsmiths, University of London. All rights reserved.
//

import UIKit
import paper_onboarding
class ViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var onboardingView: OnboardingView!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    

    @IBAction func gotStarted(_ sender: Any) {
        /*let mainSb = UIStoryboard(name: "Main", bundle: nil)
        let left = mainSb.instantiateViewController(withIdentifier: "left")
        let middle = mainSb.instantiateViewController(withIdentifier: "middle")
        let right = mainSb.instantiateViewController(withIdentifier: "right")
        let top = mainSb.instantiateViewController(withIdentifier: "top")
        let snapContainer = SnapContainerViewController.containerViewWith(left, middleVC: middle, rightVC: right, topVC: top)
        self.present(snapContainer, animated: true, completion: nil)*/
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Paper Onboarding Library
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let backgroundColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backgroundColorThree = UIColor(red: 168/255, green: 200/255, blue: 70/255, alpha: 1)
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [OnboardingItemInfo(informationImage: UIImage(named:"rocket")!,
                                   title: "geofood",
                                   description: "yo big man",
                                   pageIcon: UIImage(named:"rocket")!,
                                   color: backgroundColorOne,
                                   titleColor: backgroundColorTwo,
                                   descriptionColor: backgroundColorThree,
                                   titleFont: titleFont,
                                   descriptionFont: descriptionFont),
                OnboardingItemInfo(informationImage: UIImage(named:"brush")!,
                                   title: "hasnat",
                                   description: "need some cool icons",
                                   pageIcon: UIImage(named:"brush")!,
                                   color: backgroundColorTwo,
                                   titleColor: backgroundColorThree,
                                   descriptionColor: backgroundColorOne,
                                   titleFont: titleFont,
                                   descriptionFont: descriptionFont),
                OnboardingItemInfo(informationImage: UIImage(named:"rocket")!,
                                   title: "blahblah",
                                   description: "qwerty abcabcabc qwerty",
                                   pageIcon: UIImage(named:"brush")!,
                                   color: backgroundColorThree,
                                   titleColor: backgroundColorOne,
                                   descriptionColor: backgroundColorTwo,
                                   titleFont: titleFont,
                                   descriptionFont: descriptionFont)][index]
        
        
    }
    
    func onboardingConfigurationItem(_: OnboardingContentViewItem, index: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            UIView.animate(withDuration: 0.2, animations: {
                self.getStartedButton.alpha = 0
            })
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 0.4, animations: {
                self.getStartedButton.alpha = 1
            })
        }
    }

    
}
