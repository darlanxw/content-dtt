//
//  MenuViewController.swift
//  ContentDTT
//
//  Created by MacDD02 on 05/09/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import UIKit
import SwiftSVG

class MenuViewController: UIViewController {
    
    @IBOutlet var iconeOne:UIView!
    @IBOutlet var iconeTwo:UIView!
    let green = UIColor(red: 132.0, green: 190.0, blue: 6.0, alpha: 2.00).cgColor
    let black = UIColor(red:0, green:0, blue:0, alpha:1.00).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let documents = UIView(SVGNamed: "sap_documentos") { (svgLayer) in
            svgLayer.fillColor = UIColor.green.cgColor
            svgLayer.resizeToFit(CGRect(x: 38, y: 157, width: 40, height: 40))
        }
        
        let contacts = UIView(SVGNamed: "sap_contacts") { (svgLayer) in
            svgLayer.fillColor = UIColor(red:0, green:0, blue:0, alpha:1.00).cgColor
            svgLayer.resizeToFit(CGRect(x: 38, y: 221, width: 40, height: 40))
        }
        
        let gestureDocuments = UITapGestureRecognizer(target: self, action:  #selector (self.actionDocument(_:)))
        
        let gestureContacts = UITapGestureRecognizer(target: self, action:  #selector (self.actionContact (_:)))
        
        self.iconeOne.addSubview(documents)
        self.iconeTwo.addSubview(contacts)
        
        self.iconeOne.addGestureRecognizer(gestureDocuments)
        self.iconeTwo.addGestureRecognizer(gestureContacts)
        
    }
    
    func actionDocument(_ sender:UITapGestureRecognizer){
        let documents = UIView(SVGNamed: "sap_documentos") { (svgLayer) in
            svgLayer.fillColor = UIColor.green.cgColor
            svgLayer.resizeToFit(CGRect(x: 38, y: 157, width: 40, height: 40))
        }
        
        let contacts = UIView(SVGNamed: "sap_contacts") { (svgLayer) in
            svgLayer.fillColor = self.black
            svgLayer.resizeToFit(CGRect(x: 38, y: 221, width: 40, height: 40))
        }

        self.iconeOne.addSubview(documents)
        self.iconeTwo.addSubview(contacts)
        
        
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc1")
        
        let vc = UIApplication.shared.keyWindow?.rootViewController as! ViewController
        vc.addChildViewController(vc1)
        vc.viewContainer.addSubview(vc1.view)
    }
    
    func actionContact(_ sender:UITapGestureRecognizer){
        let documents = UIView(SVGNamed: "sap_documentos") { (svgLayer) in
            svgLayer.fillColor = self.black
            svgLayer.resizeToFit(CGRect(x: 38, y: 157, width: 40, height: 40))
        }
        
        let contacts = UIView(SVGNamed: "sap_contacts") { (svgLayer) in
            svgLayer.fillColor = UIColor.green.cgColor
            svgLayer.resizeToFit(CGRect(x: 38, y: 221, width: 40, height: 40))
        }
        
        self.iconeOne.addSubview(documents)
        self.iconeTwo.addSubview(contacts)
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc2")
        
        let vc = UIApplication.shared.keyWindow?.rootViewController as! ViewController
        vc.addChildViewController(vc1)
        vc.viewContainer.addSubview(vc1.view)
    }
    
    @IBAction func setVc1(){
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc1")
        
        let vc = UIApplication.shared.keyWindow?.rootViewController as! ViewController
        vc.addChildViewController(vc1)
        vc.viewContainer.addSubview(vc1.view)
    }
    
    @IBAction func setVc2(){
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc2")
        
        let vc = UIApplication.shared.keyWindow?.rootViewController as! ViewController
        vc.addChildViewController(vc1)
        vc.viewContainer.addSubview(vc1.view)
    }
}
