//
//  CheckListViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/17.
//

import UIKit

class CheckListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var CheckTableView: UITableView!
    
    var CheckList = [String]()
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        if let storedTodoList = userDefaults.array(forKey: "CheckList")as? [String] {
            CheckList.append(contentsOf: storedTodoList)
        
        }
        
    }

        @IBAction  func addBtnAction(_ sender: Any){
        let alertController = UIAlertController(title: "チェック項目追加", message: "チェック項目を入力してください", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
            if let textField = alertController.textFields?.first {
            self.CheckList.insert(textField.text!, at: 0)
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
                
            self.userDefaults.set(self.CheckList, forKey: "CheckList")
            }

        }
        alertController.addAction(okAction)
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
        
    }



   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return CheckList.count
}

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath)
    let todoTitle = CheckList[indexPath.row]
    cell.textLabel?.text = todoTitle
    return cell
}
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
        CheckList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            
        userDefaults.set(CheckList, forKey: "CheckList")
            }
        }
    
}


