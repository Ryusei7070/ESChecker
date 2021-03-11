//
//  ESListViewController.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/11.
//

import UIKit
import NCMB

class ESListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var memoArray = [NCMBObject]()
    
    @IBOutlet var memoTableView: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
