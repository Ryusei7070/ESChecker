//
//  CheckListTableViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/17.
//

import UIKit

class CheckListViewController: UITableViewController {

    // アイテムの型
    class Item {
        var title : String
        var done: Bool = false

        init(title: String) {
            self.title = title
        }
    }
    class Items {
        var list : [Item] = []
        public var count: Int{
            return self.list.count
        }
        func remove(at: Int){
            list.remove(at: at)
        }
        func append(_ item:Item){
            list.append(item)
        }
        private func getTitles() -> [String] {
            var ret: [String] = []
            for item in list{
                ret.append(item.title)
            }
            return ret
        }
        private func getDones() -> [Bool]{
            var net: [Bool] = []
            for item in list{
                net.append(item.done)
            }
            return net
        }
        func saveInUserdefaults(){
            let userDefaults = UserDefaults.standard
            userDefaults.set(self.getDones(), forKey: "CheckListD")
            userDefaults.set(self.getTitles(), forKey: "CheckListT")
        }
    }

    // この配列に作ったアイテムを追加していく
    var CheckList = Items()
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {

        super.viewDidLoad()

        //データの読み込み（チェックマークの保存も含む）
        if let storedCheckList = userDefaults.array(forKey: "CheckListT") as? [String] {
            let ddd = userDefaults.array(forKey: "CheckListD") as! [Bool]
            for i in 0..<storedCheckList.count {
                let item = Item(title: storedCheckList[i])
                item.done = ddd[i]
                CheckList.append(item)
            }
        }


        else{
            // あらかじめ3つアイテムを作っておく
            let item1: Item = Item(title: "服装は乱れていないか？")
            let item2: Item = Item(title: "襟は左右対称になっているか？")
            let item3: Item = Item(title: "髪は乱れていないか？")

            // 配列に追加
            CheckList.append(item1)
            CheckList.append(item2)
            CheckList.append(item3)
            
        }
        


    }



    // MARK - セルの数を指定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return CheckList.count

    }



    // MARK - セルのカスタマイズ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckItemCell", for: indexPath)
        let item = CheckList.list[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell

    }

// MARK - チェックマーク機能
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択されたセルに実行される処理

        let item = CheckList.list[indexPath.row]

        // チェックマーク
        item.done = !item.done

        // リロードしてUIに反映
        self.tableView.reloadData()

        // セルを選択した時の背景の変化を遅くする
        tableView.deselectRow(at: indexPath, animated: true)
        
        CheckList.saveInUserdefaults()

    }

    // MARK - 新規アイテム追加機能
       @IBAction func addButtonPressed(_ sender: Any) {
           // プラスボタンが押された時に実行される処理

           var textField = UITextField()

           let alert = UIAlertController(title: "新しいアイテムを追加", message: "", preferredStyle: .alert)

           let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
               // 「リストに追加」を押された時に実行される処理

           let newItem: Item = Item(title: textField.text!)

               // アイテム追加処理
               self.CheckList.append(newItem)
               self.tableView.reloadData()
            self.CheckList.saveInUserdefaults()

           }

           alert.addTextField { (alertTextField) in
               alertTextField.placeholder = "新しいアイテム"
               textField = alertTextField
           }

           alert.addAction(action)
           present(alert, animated: true, completion: nil)
        
       }


    // MARK - スワイプでのアイテム削除機能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            // アイテム削除処理
        CheckList.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        self.CheckList.saveInUserdefaults()
        
        
        }

       }
    

