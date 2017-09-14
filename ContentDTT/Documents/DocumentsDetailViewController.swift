//
//  DocumentsDetailViewController.swift
//  ContentDTT
//
//  Created by MacDD02 on 11/09/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import SwiftSVG
import QuickLook

class DocumentsDetailViewController : UIViewController, QLPreviewControllerDataSource {
    /*!
     * @abstract Returns the number of items that the preview controller should preview.
     * @param controller The Preview Controller.
     * @result The number of items.
     */
    @available(iOS 4.0, *)
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return fileURLs.count
    }
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewContainer:UIView!
    @IBOutlet var tableView:UITableView!
    var titleNavigation:String?
    @IBOutlet var titleDetail:UILabel!
    var fileURLs = [NSURL]()
    
    let quickLookController = QLPreviewController()
    
    var arrayActive = ["":""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        quickLookController.dataSource = self
        self.tableView.backgroundColor = UIColor.clear
        
        if let myTitle = titleNavigation {
            titleDetail.text = myTitle
        }
        
        //playVideo()
        prepareFileURLs()
    }
    
    func prepareFileURLs() {
        for file in arrayActive {
            if let fileURL = Bundle.main.url(forResource: file.key, withExtension: file.value) {
                if FileManager.default.fileExists(atPath: fileURL.path) {
                    fileURLs.append(fileURL as NSURL)
                }
            }
        }
    }
    
    func numberOfPreviewItemsInPreviewController(controller: QLPreviewController) -> Int {
        return fileURLs.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return fileURLs[index]
    }
    
    func playVideo(name: String, type: String) {
        guard let path = Bundle.main.path(forResource: name, ofType:type) else {
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
    
    @IBAction func back(){
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc1")
        
        let vc = UIApplication.shared.keyWindow?.rootViewController as! ViewController
        vc.addChildViewController(vc1)
        vc.viewContainer.addSubview(vc1.view)
    }
}

extension DocumentsDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayActive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCategory") as! CellCategory
        
        var keys = [String] (arrayActive.keys)
        var values = [String] (arrayActive.values)
        let value = values[indexPath.row]
        
        cell.lbTitle.text = keys[indexPath.row]
        if value == "pptx" {
            cell.imageLogo?.image = UIImage(named: "sap_ppt")
        }else if value == "mp4" || value == "avi" {
            cell.imageLogo?.image = UIImage(named: "sap_video")
        }else if value == "pdf" {
              cell.imageLogo?.image = UIImage(named: "sap_doc")
        }else {
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var keys = [String] (arrayActive.keys)
        var values = [String] (arrayActive.values)
        
        if values[indexPath.row] == "mp4" {
            playVideo(name: keys[indexPath.row], type: values[indexPath.row])
        }else{
            if QLPreviewController.canPreview(fileURLs[indexPath.row]) {
                quickLookController.currentPreviewItemIndex = indexPath.row
                present(quickLookController, animated: true, completion: nil)
            }}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
