//
//  LeadsTableViewController.swift
//  ContentDTT
//
//  Created by MacDD02 on 31/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import UIKit

class LeadsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewContainer:UIView!
    @IBOutlet var tableView:UITableView!
    
    let documents = ["Ulisses Tristão", "Carlos Fogarolli", "Darlan Borges", "Paulo Oliveira", "Thiago Vian", "Fábio Ferreira", "Ricardo Correia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.backgroundColor = UIColor.white
    }
    
    @IBAction func newLead(){
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewLeadViewController")
    
        let vc = UIApplication.shared.keyWindow?.rootViewController as! ViewController
        vc.addChildViewController(vc1)
        vc.viewContainer.addSubview(vc1.view)
    }
}

extension LeadsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellContact")!
        
        cell.textLabel?.text = documents[indexPath.row]
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
