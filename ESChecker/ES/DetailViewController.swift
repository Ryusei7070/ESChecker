//
//  DetailViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/11.
//

import UIKit
import KRProgressHUD

class DetailViewController: UIViewController {
    
    var selectedrow: Int!
    var selectedES: String!

    @IBOutlet var ESTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ESTextView.text = selectedES
    }
    @IBAction func deleteMemo() {
        let ud = UserDefaults.standard
        if ud.array(forKey: "ESArray") != nil {
            var saveMemoArray = ud.array(forKey: "ESArray") as! [String]
            saveMemoArray.remove(at: selectedrow)
            ud.set(saveMemoArray, forKey: "ESArray")
            ud.synchronize()
            self.navigationController?.popViewController(animated: true)
        }
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
            saveMemoArray.remove(at: selectedrow)
            ud.set(saveMemoArray,forKey: "ESArray")
            ud.synchronize()
            self.navigationController?.popViewController(animated: true)
        }
 
   }

    
}
