//
//  ESListViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/11.
//

import UIKit


class ESListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var ESArray = [String]()
    
    @IBOutlet var ESTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ESTableView.dataSource = self
        ESTableView.delegate = self
        
        ESTableView.tableFooterView = UIView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ESArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = ESArray[indexPath.row]
        return cell
    }
    func loadMemo() {
        let ud = UserDefaults.standard
        if ud.array(forKey: "ESArray") != nil {
            ESArray = ud.array(forKey: "ESArray") as! [String]
            ESTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面の取得（Detail）
        if segue.identifier == "toDetail"{
            let detailViewController = segue.destination as! DetailViewController
            let selectedIndex = ESTableView.indexPathForSelectedRow!
            detailViewController.selectedES = ESArray[selectedIndex.row]
            detailViewController.selectedrow = selectedIndex.row
        }
    
    }
    
}
