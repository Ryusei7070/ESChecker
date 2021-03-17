//
//  TODOListViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/17.
//
import UIKit

class TODOListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var ToDoTableView: UITableView!
    
    var TODOList = [String]()
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        if let storedTodoList = userDefaults.array(forKey: "TODOList")as? [String] {
            TODOList.append(contentsOf: storedTodoList)
        
        }
        
    }

        @IBAction  func addBtnAction(_ sender: Any){
        let alertController = UIAlertController(title: "TODO追加", message: "TODOを入力してください", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
            if let textField = alertController.textFields?.first {
            self.TODOList.insert(textField.text!, at: 0)
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
                
            self.userDefaults.set(self.TODOList, forKey: "TODOList")
            }

        }
        alertController.addAction(okAction)
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
        
    }



   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return TODOList.count
}

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TODOCell", for: indexPath)
    let todoTitle = TODOList[indexPath.row]
    cell.textLabel?.text = todoTitle
    return cell
}
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
        TODOList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            
        userDefaults.set(TODOList, forKey: "TODOList")
            }
        }
    
}


