//
//  DetailViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/11.
//

import UIKit
import NCMB
import KRProgressHUD

class DetailViewController: UIViewController {
    
    var selectedES: NCMBObject!

    @IBOutlet var ESTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ESTextView.text = selectedES.object(forKey: "es") as? String
    }
    

    @IBAction func update() {
        selectedES.setObject(ESTextView.text, forKey: "es")
        selectedES.saveInBackground { (error) in
            if error != nil {
                KRProgressHUD.showError(withMessage: error?.localizedDescription)
            } else {
                //成功
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func delete() {
        selectedES.deleteInBackground { (error) in
           if error != nil {
                KRProgressHUD.showError(withMessage: error?.localizedDescription)
            } else {
                
            self.navigationController?.popViewController(animated: true)
                
            }
        }
    }
}
