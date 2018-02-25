//
//  MiddleViewController.swift
//  GeoFood
//
//  Created by Wojciech Tyziniec on 20/02/2018.
//  Copyright © 2018 Goldsmiths, University of London. All rights reserved.
//

import UIKit
import AVFoundation

class MiddleViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var previewLayer = AVCaptureVideoPreviewLayer()
    @IBOutlet weak var signupButton: UIButton!
    let session = AVCaptureSession()

    @IBOutlet weak var urlLabel: UILabel!
    let codeFrame:UIView = {
        let codeFrame = UIView()
        codeFrame.layer.borderColor = UIColor.green.cgColor
        codeFrame.layer.borderWidth = 2
        codeFrame.frame = CGRect.zero
        codeFrame.translatesAutoresizingMaskIntoConstraints = false
        return codeFrame
    }()
    
    override func viewDidLoad() {
        codeFrame.tag = 5
        self.view.addSubview(signupButton)
        super.viewDidLoad()
        //Create session
        //Define capture device
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }
        catch {
            print("ERROR")
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)
        session.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            print("QR Code not detected")
            if let viewWithTag = self.view.viewWithTag(5){
                viewWithTag.removeFromSuperview()
                print("remove that shit")
            }
            
            return
        }
        let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        guard let stringCodeValue = metadataObject.stringValue else { return }
        view.addSubview(codeFrame)
        print("QR Code URL = " + stringCodeValue)
        urlLabel.text = stringCodeValue
        //self.view.bringSubview(toFront: signupButton)
        guard let barcodeObject = previewLayer.transformedMetadataObject(for: metadataObject) else { return }
        codeFrame.frame = barcodeObject.bounds
        let alert = UIAlertController(title: "Detected product", message: "Idk just testing", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            self.session.startRunning()
            if let viewWithTag = self.view.viewWithTag(5){
                viewWithTag.removeFromSuperview()
                print("remove that shit")
            }
        })
        self.present(alert, animated: true)
        session.stopRunning()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        session.stopRunning()
    }
    
}

