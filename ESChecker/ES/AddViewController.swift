//
//  AddViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/11.
//

import UIKit
import NCMB

class AddViewController: UIViewController {
    
    @IBOutlet var ESTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ESTextView.becomeFirstResponder()
    }
    
    @IBAction func save() {
        let object = NCMBObject(className: "ES")
        object?.setObject(ESTextView.text, forKey: "es")
        object?.saveInBackground({ (error) in
            if error != nil {
                print(error!)
            } else {
                let alertController = UIAlertController(title: "保存完了", message: "保存が完了しました。ES一覧に戻ります。", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        } )
    }
    

}

        
