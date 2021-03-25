//
//  ESListViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/11.
//

import UIKit
import NCMB


class ESListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var ESArray = [NCMBObject]()
    
    @IBOutlet var ESTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ESTableView.dataSource = self
        ESTableView.delegate = self
        
        ESTableView.tableFooterView = UIView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ESArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = ESArray[indexPath.row].object(forKey: "es") as? String
        return cell
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
        }
    
    }
    
    func loadData() {
        let query = NCMBQuery(className: "ES")
        query?.findObjectsInBackground({ (result, error) in
            if error != nil {
                print(error!)
            } else {
                self.ESArray = result as! [NCMBObject]
                self.ESTableView.reloadData()
            }
        })
    }
}
