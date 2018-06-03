//
//  ViewController.swift
//  Calculator
//
//  Created by 1049056949@qq.com on 03/29/2018.
//  Copyright (c) 2018 1049056949@qq.com. All rights reserved.
//

import UIKit
import Calculator

class ViewController: UIViewController, UITextFieldDelegate {
    let inputVC: CalculatorController = CalculatorController()
    let calculator:Calculator = Calculator()
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.inputView = inputVC.view
        textField.delegate = self
        calculator.didFinishCalculateBlock = {countString in
            self.textField.text = countString
        }
        inputVC.didSeletctItemBlock = {str in
            self.textField.text = (self.textField.text ?? "") + str
            self.calculator.calculate(str)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    // MARK: - UITextField deleget
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        calculator.reset()
        return true
    }
}

