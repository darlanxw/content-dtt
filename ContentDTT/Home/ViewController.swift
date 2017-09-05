//
//  ViewController.swift
//  ContentDTT
//
//  Created by MacDD02 on 30/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewContainer:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc1")
        
        
        self.addChildViewController(vc1)
        self.viewContainer.addSubview(vc1.view)
    }
    
    @IBAction func setVc1(){
        viewContainer.backgroundColor = UIColor.orange
    }
    
    @IBAction func setVc2(){
    }
}

