//
//  DocumentsViewController.swift
//  ContentDTT
//
//  Created by MacDD02 on 31/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import UIKit
import SwiftSVG

class DocumentsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewContainer:UIView!
    @IBOutlet var tableView:UITableView!
    
    let documents = ["Gestão Financeira", "Integração de Sistemas", "SAP Hana", "Hybris Marketing", "SAP Hybris"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.backgroundColor = UIColor.clear
    
    }
}

extension DocumentsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCategory") as! CellCategory
        
        cell.lbTitle.text = documents[indexPath.row]
        
        cell.name.text = documents[indexPath.row].characters.first?.description
        cell.img.layer.cornerRadius = 18.0
        cell.img.clipsToBounds = true
        cell.img.backgroundColor = UIColor.random()
        
        
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
