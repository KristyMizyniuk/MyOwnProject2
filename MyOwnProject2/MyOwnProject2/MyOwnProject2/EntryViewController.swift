//
//  EntryViewController.swift
//  MyOwnProject2
//
//  Created by Христина Мізинюк on 11/21/22.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.placeholder = "I want to buy..."
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveShoppingList))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveShoppingList()
        
        return true
    }
    
    @objc func saveShoppingList() {
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count + 1
   
       UserDefaults().set(newCount, forKey: "count")
       UserDefaults().set(text, forKey: "shoppingList_\(newCount)")
        
       update?()
       
       navigationController?.popViewController(animated: true)
    }
}

