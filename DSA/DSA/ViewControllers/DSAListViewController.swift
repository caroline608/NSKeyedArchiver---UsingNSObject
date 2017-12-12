//
//  ViewController.swift
//  DSA
//
//  Created by Caroline Cruz on 12/12/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import UIKit

class DSAListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       DataModel.shared.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
}

extension DSAListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModel.shared.getLists().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DSACell", for: indexPath)
        let dsaItem = DataModel.shared.getLists()[indexPath.row]
        cell.textLabel?.text = dsaItem.dsaTitle
        return cell
    }
}
