//
//  QRCodeViewController.swift
//  QRCodeReader
//
//  Created by Mobile Dev on 13/7/2017.
//  Copyright © 2017 Mobile Dev. All rights reserved.
//

import UIKit
import MessageUI


class QRCodeViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickPartsPage(_ sender: Any) {
        
        let url = URL(string: "http://www.loading-automation.com/Pneumatic-rollertrack.html")
        
        if #available(iOS 10.0, *){
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }

    @IBAction func onClickCall(_ sender: Any) {
        
        let strPhone = "1-800-264-3184"
        
        let phone = "tel://" + strPhone
        
        if let url = URL(string: phone){
            if #available(iOS 10, *){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            else{
                UIApplication.shared.openURL(url)
            }
        }
        
    }
    
    @IBAction func onClickLogo(_ sender: Any) {
        
        let url = URL(string: "http://www.loading-automation.com")
        
        if #available(iOS 10.0, *){
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    
    @IBAction func onClickEmail(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
            let mailVC = MFMailComposeViewController()
            
            mailVC.setToRecipients(["app@loading-automation.com"])
            mailVC.mailComposeDelegate = self;
            
            self.present(mailVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation

    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
    }
    

}
