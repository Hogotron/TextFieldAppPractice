//
//  ViewController.swift
//  TextFieldAppPractice
//
//  Created by Tomas Sidenfaden on 7/12/17.
//  Copyright © 2017 Tomas Sidenfaden. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockableTextFieldEditingSwitch: UISwitch!
    
    // MARK: Text field delegate objects
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // MARK: Set text field delegates
        self.zipCodeTextField.delegate = zipCodeTextFieldDelegate
        self.cashTextField.delegate = cashTextFieldDelegate
        
        self.lockableTextFieldEditingSwitch.setOn(false, animated: true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.lockableTextFieldEditingSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func toggleTextEditor(_ sender: AnyObject) {
        if (sender as! UISwitch).isOn {
            self.lockableTextFieldEditingSwitch.resignFirstResponder()
        }
    }
}

