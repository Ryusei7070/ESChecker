//
//  AddViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/11.
//

import UIKit


class AddViewController: UIViewController {
    
    @IBOutlet var ESTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ESTextView.becomeFirstResponder()
    }
    
    @IBAction func save() {
        let inputText = ESTextView.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "ESArray") != nil {
            var saveMemoArray = ud.array(forKey: "ESArray") as! [String]
            
            if inputText != nil{
                saveMemoArray.append(inputText!)
            } else {
                print("何も入力されていません")
            }
            ud.set(saveMemoArray, forKey: "ESArray")
        } else {
            var newMemoArray = [String]()
            
            if inputText != nil{
                newMemoArray.append(inputText!)
            } else {
                print("何も入力されていません")
            }
            ud.set(newMemoArray,forKey: "ESArray")
    }
        ud.synchronize()
        self.navigationController?.popViewController(animated: true)
   }

    

}

        
