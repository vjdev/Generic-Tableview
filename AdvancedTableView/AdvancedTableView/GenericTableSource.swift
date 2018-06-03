//
//  GenericTableSource.swift
//  AdvancedTableView
//
//  Created by vijeesh on 23/05/2018.
//  Copyright © 2018 vijeesh. All rights reserved.
//

import Foundation
import UIKit

class GenericTableSource : NSObject {
  
  private var cellID: String = ""
  
  private (set) var data : [Any]  = []
  
  func registerCell(identifier: String, data : [String], tableView: UITableView) {
    
    if identifier.isEmpty {
      fatalError("Tableview cell identifier can't be empty or nil")
    } else {
      self.cellID = identifier
      self.data = data
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellID)
    }
  }
  
  func cell(indexPath : IndexPath, tableview : UITableView)-> UITableViewCell {
    let cell  = tableview.dequeueReusableCell(withIdentifier: self.cellID)
    cell?.textLabel?.text = self.data[indexPath.row] as? String
    return cell!
  }
  
}

//MARK: Tableview Delegate and DataSource
extension GenericTableSource : UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.data.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return self.cell(indexPath: indexPath, tableview: tableView)
  }
}
