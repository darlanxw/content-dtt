//
//  NewLeadViewController.swift
//  ContentDTT
//
//  Created by MacDD02 on 08/09/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import UIKit

class NewLeadViewController : UIViewController {
    @IBOutlet var txName:UITextField!
    @IBOutlet var txCompany:UITextField!
    @IBOutlet var txNumber:UITextField!
    @IBOutlet var txEmail:UITextField!
    @IBOutlet var btnSave:UIButton!
    @IBOutlet var btnCancel:UIButton!
    
    var leadData:LeadData = LeadData()
    
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
        btnSave.backgroundColor = UIColor(red:0.00, green:0.70, blue:0.00, alpha:1.0)
        btnSave.tintColor = UIColor.white
        
        btnCancel.layer.borderColor = UIColor.white.cgColor
        btnCancel.layer.borderWidth = 1.0
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewLeadViewController.keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewLeadViewController.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(){
        let name = txName.text!
        let company = txCompany.text!
        let number = txNumber.text!
        let email = txEmail.text!
        
        let alert = UIAlertController.init(title:"Confirmação",
                                           message: "Cadastro salvo com sucesso!",
                                           preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (_) in
            self.leadData.create(name: name, company: company, number: number, email: email)
            alert.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        })
        
        
        
    }
}
