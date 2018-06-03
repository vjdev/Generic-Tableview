//
//  SecondViewController.swift
//  AdvancedTableView
//
//  Created by vijeesh on 23/05/2018.
//  Copyright © 2018 vijeesh. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {

  @IBOutlet final weak var secondTableView: UITableView!
  var genericListTableViewDataSource = GenericTableSource()
  override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCreation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
  func tableViewCreation() {
    let data = ["*","****","****"];
   
    self.secondTableView.dataSource = genericListTableViewDataSource;
genericListTableViewDataSource.registerCell(identifier:"cell list 2" , data:data, tableView: self.secondTableView)
    DispatchQueue.main.async {
      self.secondTableView?.reloadData()
    }
  }
}
