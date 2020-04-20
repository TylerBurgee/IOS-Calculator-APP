//
//  ViewController.swift
//  Calculator
//
//  Created by Tyler Burgee on 4/16/20.
//  Copyright © 2020 Tyler Burgee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Calculation Label
    @IBOutlet weak var Result: UILabel!
    
    var user_oper = ""
    var user_nums1 = [Int]()
    var user_nums2 = [Int]()
    var user_int1 = 0
    var user_int2 = 0
    var user_string1 = ""
    var user_string2 = ""
    var calculation:Int = 0
    var value = 0
    var arr_value = 0
    var second_value_isclear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func HandleValues (ButtonNum:Int) {
        if (user_oper == "") {
            if (Result.text == "0") {
                Result.text = nil
            }
            user_nums1.append(ButtonNum)
            Result.text = (Result.text ?? "") + String(ButtonNum)
        }
        else {
            if (second_value_isclear) {
                Result.text = nil
            }
            second_value_isclear = false
            user_nums2.append(ButtonNum)
            Result.text = (Result.text ?? "") + String(ButtonNum)
        }
    }
    
    func NegativeNum() {
        if (user_oper == "") {
            if (user_nums1[0] >= 0) {
                user_nums1[0] = -user_nums1[0]
                Result.text = String("-") + (Result.text ?? "")
            }
        }
        else {
            if (user_nums2[0] >= 0) {
                user_nums2[0] = -user_nums2[0]
                Result.text = String("-") + (Result.text ?? "")
            }
        }
    }
    
    func Clear() {
        user_nums1.removeAll()
        user_nums2.removeAll()
        calculation = 0
        user_oper = ""
        second_value_isclear = true
    }

    // Number Buttons
    @IBAction func B_1(_ sender: Any) {
        HandleValues(ButtonNum: 1)
    }
    @IBAction func B_2(_ sender: Any) {
        HandleValues(ButtonNum: 2)
    }
    @IBAction func B_3(_ sender: Any) {
        HandleValues(ButtonNum: 3)
    }
    @IBAction func B_4(_ sender: Any) {
        HandleValues(ButtonNum: 4)
    }
    @IBAction func B_5(_ sender: Any) {
        HandleValues(ButtonNum: 5)
    }
    @IBAction func B_6(_ sender: Any) {
        HandleValues(ButtonNum: 6)
    }
    @IBAction func B_7(_ sender: Any) {
        HandleValues(ButtonNum: 7)
    }
    @IBAction func B_8(_ sender: Any) {
        HandleValues(ButtonNum: 8)
    }
    @IBAction func B_9(_ sender: Any) {
        HandleValues(ButtonNum: 9)
    }
    @IBAction func B_0(_ sender: Any) {
        HandleValues(ButtonNum: 0)
    }
    
    // Operator and Function Buttons
    @IBAction func B_Add(_ sender: Any) {
        user_oper = "+"
    }
    @IBAction func B_Subtract(_ sender: Any) {
        user_oper = "-"
    }
    @IBAction func B_Multiply(_ sender: Any) {
        user_oper = "*"
    }
    @IBAction func B_Divide(_ sender: Any) {
        user_oper = "/"
    }
    @IBAction func B_Remainder(_ sender: Any) {
        user_oper = "%"
    }
    @IBAction func B_PlusOrMinus(_ sender: Any) {
        NegativeNum()
    }
    @IBAction func B_Decimal(_ sender: Any) {
    }
    @IBAction func B_AC(_ sender: Any) {
        Clear()
        Result.text = String(calculation)
    }
    @IBAction func B_Equate(_ sender: Any) {
        if (user_oper == "+") {
            user_string1 = user_nums1.map(String.init).joined()
            let user_int1 = Int(user_string1)
            
            user_string2 = user_nums2.map(String.init).joined()
            let user_int2 = Int(user_string2)
            
            calculation = user_int1! + user_int2!
            Result.text = String(calculation)
            Clear()
        }
        else if (user_oper == "-") {
            user_string1 = user_nums1.map(String.init).joined()
            let user_int1 = Int(user_string1)
            
            user_string2 = user_nums2.map(String.init).joined()
            let user_int2 = Int(user_string2)
            
            calculation = user_int1! - user_int2!
            Result.text = String(calculation)
            Clear()
        }
        else if (user_oper == "*") {
            user_string1 = user_nums1.map(String.init).joined()
            let user_int1 = Int(user_string1)
            
            user_string2 = user_nums2.map(String.init).joined()
            let user_int2 = Int(user_string2)
            
            calculation = user_int1! * user_int2!
            Result.text = String(calculation)
            Clear()
        }
        else if (user_oper == "/") {
            user_string1 = user_nums1.map(String.init).joined()
            let user_int1 = Int(user_string1)
            
            user_string2 = user_nums2.map(String.init).joined()
            let user_int2 = Int(user_string2)
            
            calculation = user_int1! / user_int2!
            Result.text = String(calculation)
            Clear()
        }
        else if (user_oper == "%") {
            user_string1 = user_nums1.map(String.init).joined()
            let user_int1 = Int(user_string1)
            
            user_string2 = user_nums2.map(String.init).joined()
            let user_int2 = Int(user_string2)
            
            calculation = user_int1! % user_int2!
            Result.text = String(calculation)
            Clear()
        }
    }
}
