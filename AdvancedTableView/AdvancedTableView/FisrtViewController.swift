//
//  FisrtViewController.swift
//  AdvancedTableView
//
//  Created by vijeesh on 23/05/2018.
//  Copyright © 2018 vijeesh. All rights reserved.
//

import UIKit


final class FisrtViewController: UIViewController {

  
  //MARK:- Outlets
  @IBOutlet private weak var firstTabelView: UITableView!
  //MARK:-
  
  
  var genericListTableSource  = GenericTableSource()

  
  //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
      self.tableViewCreation()
    }
  //MARK:-


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
  
  
  func tableViewCreation() {
    let listItems = ["Once","Two","Three","Four"]
    genericListTableSource.registerCell(identifier: "cellList", data: listItems, tableView: self.firstTabelView!)
    self.firstTabelView?.dataSource = genericListTableSource
    DispatchQueue.main.async {
      self.firstTabelView?.reloadData()
    }
  }
}


//Tableview Implementation
extension FisrtViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.performSegue(withIdentifier: "check", sender: self)
  }
}

