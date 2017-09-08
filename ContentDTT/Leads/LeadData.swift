//
//  LeadData.swift
//  ContentDTT
//
//  Created by MacDD02 on 08/09/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class LeadData {
    var coreDataStack:CoreDataStack = CoreDataStack()
    var context: NSManagedObjectContext
    
    init() {
        self.context = coreDataStack.persistentContainer.viewContext
    }
    
    func create(name: String, company: String, number: String, email: String) -> Void {
        let lead = NSEntityDescription.insertNewObject(forEntityName: "Contacts", into: context) as! Contacts
        
        lead.email = email
        lead.firm = company
        lead.number = number
        lead.name = name
        
        self.saveChanges()
    }
    
    fileprivate func get(withPredicate queryPredicate: NSPredicate) -> [Contacts]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        
        fetchRequest.predicate = queryPredicate
        
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [Contacts]
            
        } catch let error as NSError {
            // failure
            print(error)
            return [Checking]()
        }
    }
    
    // Gets a Check by id
    func getById(_ id: NSManagedObjectID) -> Checking? {
        return context.object(with: id) as? Contacts
    }
    
    // Saves all changes
    func saveChanges(){
        do{
            try context.save()
        } catch let error as NSError {
            // failure
            print(error)
        }
    }

}
