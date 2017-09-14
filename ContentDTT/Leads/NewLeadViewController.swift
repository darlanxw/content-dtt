//
//  NewLeadViewController.swift
//  ContentDTT
//
//  Created by MacDD02 on 08/09/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class NewLeadViewController : UIViewController {
    @IBOutlet var txName:UITextField!
    @IBOutlet var txCompany:UITextField!
    @IBOutlet var txNumber:UITextField!
    @IBOutlet var txEmail:UITextField!
    @IBOutlet var btnSave:UIButton!
    @IBOutlet var btnCancel:UIButton!
    
    var refContacts: DatabaseReference!
    var leadData:LeadData = LeadData()
    
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
        btnSave.backgroundColor = UIColor(red:0.00, green:0.70, blue:0.00, alpha:1.0)
        btnSave.tintColor = UIColor.white
        
        btnCancel.layer.borderColor = UIColor.white.cgColor
        btnCancel.layer.borderWidth = 1.0
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewLeadViewController.keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewLeadViewController.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //FirebaseApp.configure()
        
        //getting a reference to the node artists
        refContacts = Database.database().reference().child("contacts");
        
        txNumber.keyboardType = .numberPad
    }
    
    func addContact(name:String,company:String,email:String,number:String){
        //generating a new key inside artists node
        //and also getting the generated key
        let key = refContacts.childByAutoId().key
        
        //creating artist with the given values
        let contact = ["id":key,
                      "name": name,
                      "company": company,
                      "email": email,
                      "number": number
        ]
        
        //adding the artist inside the generated unique key
        refContacts.child(key).setValue(contact)
    }
    
    func showAlert(message: String){
        let alert = UIAlertController.init(title:"Atenção",
                                           message: message,
                                           preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { (_) in
            alert.dismiss(animated: true, completion: nil)
        })
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if txNumber.isEditing || txEmail.isEditing {
            self.view.frame.origin.y = -200 // Move view 150 points upward
        }else{
            self.view.frame.origin.y = -150 // Move view 150 points upward
        }
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(){
        let name = txName.text
        let company = txCompany.text
        var number = txNumber.text
        let email = txEmail.text
        
        if number == nil {
            number = ""
        }
        
        if name == nil || name == ""{
            showAlert(message: "Insira o nome do contato!")
        }else if company == nil || company == ""{
            showAlert(message: "Insira o nome da empresa!")
        }else if email == nil || email == ""{
            showAlert(message: "Insira o email do contato!")
        }else{
            let alert = UIAlertController.init(title:"Confirmação",
                                               message: "Cadastro salvo com sucesso!",
                                               preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (_) in
                self.leadData.create(name: name!, company: company!, number: number!, email: email!)
                self.addContact(name: name!, company: company!, email: email!, number: number!)
                alert.dismiss(animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            })
            
        }
    }
}
