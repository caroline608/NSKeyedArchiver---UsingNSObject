//
//  EditListViewController.swift
//  DSA
//
//  Created by Caroline Cruz on 12/12/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import UIKit

class EditListViewController: UIViewController {

    @IBOutlet weak var dsaTextView: UITextView!
    
    @IBOutlet weak var dsaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        guard let dsaTitle  = dsaTextField.text,
            let dsaDescription = dsaTextView.text
            else {return}
        if dsaTitle.isEmpty || dsaDescription.isEmpty {
            showAlert()
            return
        } else { // save
            let dsaItem = DSA.init(title: dsaTitle, description: dsaDescription)
            DataModel.shared.addDSAItemToList(dsaItem: dsaItem)
        }
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Missing Fields", message: "Title and Description are required", preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAlert)
        present(alertController, animated: true, completion: nil)
    }
    

}
