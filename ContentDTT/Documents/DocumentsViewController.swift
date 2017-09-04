//
//  DocumentsViewController.swift
//  ContentDTT
//
//  Created by MacDD02 on 31/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import UIKit


class DocumentsViewController: UIViewController, G8TesseractDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setTesseract(image: UIImage){
        if let tesseract = G8Tesseract(language: "eng") {
            tesseract.delegate = self
            tesseract.image = image.g8_blackAndWhite()
            tesseract.recognize()
            
            textView.text = tesseract.recognizedText
        }
    }
    
    @IBOutlet weak var imageTake: UIImageView!
    
    var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Take image
    @IBAction func takePhoto(_ sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    /*
     //MARK: - Saving Image here
     @IBAction func save(_ sender: AnyObject) {
     UIImageWriteToSavedPhotosAlbum(imageTake.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
     }
     
     //MARK: - Add image to Library
     func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
     if let error = error {
     // we got back an error!
     let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
     ac.addAction(UIAlertAction(title: "OK", style: .default))
     present(ac, animated: true)
     } else {
     let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
     ac.addAction(UIAlertAction(title: "OK", style: .default))
     present(ac, animated: true)
     }
     }*/
    
    //MARK: - Done image capture here
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageTake.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        setTesseract(image: imageTake.image!)
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress \(tesseract.progress) %")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
