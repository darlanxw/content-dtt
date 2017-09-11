//
//  LeadsTableViewController.swift
//  ContentDTT
//
//  Created by MacDD02 on 31/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LeadsViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewContainer:UIView!
    @IBOutlet var tableView:UITableView!
    
    //var coreDataStack:CoreDataStack = CoreDataStack()
    private let persistentContainer = NSPersistentContainer(name: "ContentDTT")
    
    let documents = ["Ulisses Tristão", "Carlos Fogarolli", "Darlan Borges", "Paulo Oliveira", "Thiago Vian", "Fábio Ferreira", "Ricardo Correia"]
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Contacts> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Contacts> = Contacts.fetchRequest()
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.backgroundColor = UIColor.clear
        
        loadData()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            try self.fetchedResultsController.performFetch()
            self.tableView.reloadData()
        } catch {
            let fetchError = error as NSError
            print("Unable to Perform Fetch Request")
            print("\(fetchError), \(fetchError.localizedDescription)")
        }
    }
    
    func loadData(){
        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            if let error = error {
                print("Unable to Load Persistent Store")
                print("\(error), \(error.localizedDescription)")
                
            } else {
                do {
                    try self.fetchedResultsController.performFetch()
                } catch {
                    let fetchError = error as NSError
                    print("Unable to Perform Fetch Request")
                    print("\(fetchError), \(fetchError.localizedDescription)")
                }
            }
        }
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
        guard let contacts = fetchedResultsController.fetchedObjects else { return 0 }
        
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellContact") as! CellContact
        
        let contact = fetchedResultsController.object(at: indexPath)
        
        cell.lbTitle.text = contact.name
        cell.email.text = contact.email
        cell.company.text = contact.firm
        cell.number.text = contact.number
        
        cell.name.text = contact.name?.characters.first?.description
        cell.logo.layer.cornerRadius = 18.0
        cell.logo.clipsToBounds = true
        cell.logo.backgroundColor = UIColor.random()
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
