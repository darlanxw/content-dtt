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
    
    var leadData:LeadData = LeadData()
    
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(){
        var name = txName.text!
        var company = txCompany.text!
        var number = txNumber.text!
        var email = txEmail.text!
        
        leadData.create(name: name, company: company, number: number, email: email)
    }
}
