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
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
}
