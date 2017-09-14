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
import AVKit
import AVFoundation

class DocumentsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewContainer:UIView!
    @IBOutlet var tableView:UITableView!
    
    let documents = ["Digital", "Hana Live e Integração", "S4/HANA", "SAP Leonardo", "Supply Chain", "Techtrends"]
    
    let digital = ["Deloitte - CIO Program_1":"mp4", "Deloitte Digital - part business, part creative, part technology":"mp4", "Deloitte Digitization - Tuned for the digital era af": "mp4", "Deloitte_Big Bang_FINAL - legendado": "mp4", "Digital Disruption - Short fuse, big bang":"mp4", "Hackathon Deloitte 2017":"mp4"]
    let hanaLive = ["Apresentação_SAP_FORUM_2017_HanaLive v8":"pdf", "Hana_Live_Presentation":"pdf"]
    let s4hana = ["4195946 SAP Hana Marking Video_6":"mp4","Deloitte S4HANA Approach Deck_C":"pdf","Platform Moderenization_21082017_v3":"pdf","SAP Proposal Timesaver Aug 2017 v01":"pdf","SAP S4HANA Placemat_Aug2017 v1":"pdf","The Successor to Today's ERP":"pdf"]
    let sapLeonardo = ["Deloitte reimagine solution roadmap 2017": "pdf"]
    let supplyChain = ["Deloitte Brazil Supply Chain Presentation NOV2016":"pdf", "Supply Chain Solutions - Deloitte":"pdf", "Apresentação G2M - Externa & SAP Forum": "pdf"]
    let techtrends = ["DUP_TechTrends2017": "pdf", "Tech Trends 2017 Dinner in New York": "mp4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.backgroundColor = UIColor.clear
        
        //playVideo()
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "Hackathon Deloitte 2017", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    func getFilesFromDocuments(category: String = "DIGITAL"){
        
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
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "documentsDetail") as! DocumentsDetailViewController
        
        switch documents[indexPath.row] {
        case "Digital":
            vc1.arrayActive = digital
            vc1.titleNavigation = "Digital"
            break
        case "Hana Live e Integração":
            vc1.arrayActive = hanaLive
            vc1.titleNavigation = "Hana Live e Integração"
            break
        case "S4/HANA":
            vc1.arrayActive = s4hana
            vc1.titleNavigation = "S4/HANA"
            break
        case "SAP Leonardo":
            vc1.arrayActive = sapLeonardo
            vc1.titleNavigation = "SAP Leonardo"
            break
        case "Supply Chain":
            vc1.arrayActive = supplyChain
            vc1.titleNavigation = "Supply Chain"
            break
        case "Techtrends":
            vc1.arrayActive = techtrends
            vc1.titleNavigation = "Techtrends"
            break
        default:
            vc1.arrayActive = digital
            break
        }
        
        let vc = UIApplication.shared.keyWindow?.rootViewController as! ViewController
        vc.addChildViewController(vc1)
        vc.viewContainer.addSubview(vc1.view)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
