//
//  NewViewController.swift
//  bnvm,
//
//  Created by MacBook Air on 02.09.2020.
//  Copyright © 2020 VardanMakhsudyan. All rights reserved.
//

import UIKit
protocol NewViewControllerDelegate: class {
    func newViewController(vc: NewViewController, didAddModel model: RealModel)
}

class NewViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newNumber: UITextField!
    @IBOutlet weak var newCountry: UITextField!
    @IBOutlet weak var newImage: UIImageView!
    
    weak var delegate: NewViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func photoAction(_ sender: UIBarButtonItem) {
        let alertCantroller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let alertAction1 = UIAlertAction(title: "Photo", style: .default) { (alert) in
            self.imagePicker(source: .photoLibrary)
        }
        
        let alertAction2 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
            
        }
        
        alertCantroller.addAction(alertAction1)
        alertCantroller.addAction(alertAction2)
        
        present(alertCantroller, animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        let name = newName.text ?? ""
        let number = Int(newNumber.text ?? "") ?? 0
        let country = newCountry.text ?? ""
        let image = newImage.image
        let model = RealModel(name: name, number: number, country: country, imageName: nil, image: image)
        
        delegate?.newViewController(vc: self, didAddModel: model)
    }
    
    func imagePicker(source: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = source
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        newImage.image = (editButtonItem) as? UIImage
        newImage.contentMode = .scaleAspectFill
        newImage.clipsToBounds = true
        
        dismiss(animated: true)
    }
}




