//
//  CheckListTableViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/17.
//

import UIKit

class CheckListViewController: UITableViewController {

    // この配列に作ったアイテムを追加していく
    var CheckList: [String] = []
    

    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {

        super.viewDidLoad()


        // あらかじめ3つアイテムを作っておく
        let item1: String = String("宿題をする")
        let item2: String = String("牛乳を買う")
        let item3: String = String("手紙を書く")

        // 配列に追加
        CheckList.append(item1)
        CheckList.append(item2)
        CheckList.append(item3)

    }



    // MARK - セルの数を指定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return CheckList.count

    }



    
    // MARK - セルのカスタマイズ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckItemCell", for: indexPath)
        let item = CheckList[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell

    }

// MARK - チェックマーク機能
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択されたセルに実行される処理

        let item = CheckList[indexPath.row]

        // チェックマーク
        item.done = !item.done

        // リロードしてUIに反映
        self.tableView.reloadData()

        // セルを選択した時の背景の変化を遅くする
        tableView.deselectRow(at: indexPath, animated: true)

    }

      // MARK - 新規アイテム追加機能
       @IBAction func addButtonPressed(_ sender: Any) {
       // プラスボタンが押された時に実行される処理

           let alertController = UIAlertController(title: "チェック項目追加", message: "チェック項目を入力してください。", preferredStyle: UIAlertController.Style.alert)
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


// MARK - スワイプでのアイテム削除機能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        // アイテム削除処理
        CheckList.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        userDefaults.set(CheckList, forKey: "CheckList")
    }

}
