//
//  ViewController.swift
//  hw1_calculator
//
//  Created by Frank Wang on 2016/3/10.
//  Copyright © 2016年 Frank Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inputNumber:Double = 0
    var result:Double = 0
    var answer:Double = 0
    var pressOperator = 0 //0+ 1- 2* 3/
    var isFirstNumber = true
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func pressClear(sender: UIButton) {
        self.title = "AC"
        answerLabel.text = "0"
        inputNumber = 0
        result = 0
        answer = 0
        isFirstNumber = true
    }
    
    @IBAction func pressFlip(sender: UIButton) {
        if Double(answerLabel.text!) > 0{
            answerLabel.text = "-" + answerLabel.text!
        }else{
            let notPositive = Double(answerLabel.text!)
            let newNumber = abs(notPositive!)
            answerLabel.text = String(newNumber)
        }
    }
    
    @IBAction func pressDot(sender: UIButton) {
        let currentNumber = Double(answerLabel.text!)
        if currentNumber > 0{
            answerLabel.text = answerLabel.text! + "."
        }else if currentNumber == 0{
            answerLabel.text = "0."
        }
        isFirstNumber = true
    }
    
    @IBAction func pressPercentage(sender: UIButton) {
        answerLabel.text = String(Double(answerLabel.text!)!/100)
    }
    
    @IBAction func pressOne(sender: UIButton) {
        pressNumberButton(1)
    }
    
    @IBAction func pressTwo(sender: UIButton) {
        pressNumberButton(2)
    }

    @IBAction func pressThree(sender: UIButton) {
        pressNumberButton(3)
    }
    
    @IBAction func pressFour(sender: UIButton) {
        pressNumberButton(4)
    }
    
    @IBAction func pressFive(sender: UIButton) {
        pressNumberButton(5)
    }
    
    @IBAction func pressSix(sender: UIButton) {
        pressNumberButton(6)
    }
    
    @IBAction func pressSeven(sender: UIButton) {
        pressNumberButton(7)
    }
    
    @IBAction func pressEight(sender: UIButton) {
        pressNumberButton(8)
    }
    
    @IBAction func pressNine(sender: UIButton) {
        pressNumberButton(9)
    }
    
    @IBAction func pressZero(sender: UIButton) {
        if answerLabel.text == "0"{
            answerLabel.text = "0"
        }else if answerLabel.text == ""{
            answerLabel.text = "0"
        }else{
            answerLabel.text = String(Double(answerLabel.text!)! * 10)
        }
    }
    
    
    @IBAction func pressPlus(sender: UIButton) {
        pressOperatorButton(0)
    }
    
    @IBAction func pressMinus(sender: UIButton) {
        pressOperatorButton(1)
    }
    
    @IBAction func pressTimes(sender: UIButton) {
        pressOperatorButton(2)
    }
    
    @IBAction func pressDevide(sender: UIButton) {
        pressOperatorButton(3)
    }
   
    
    func pressOperatorButton(operatorPressed:Int){
        pressOperator = operatorPressed
        
        isFirstNumber = false
        answerLabel.text = ""
        inputNumber = 0
        print("input\(inputNumber)")
        print("result\(result)")

    }
    
    @IBAction func pressEqual(sender: UIButton) {
        inputNumber = Double(answerLabel.text!)!
        
        answer = result
        answerLabel.text = String(answer)
        print("input\(inputNumber)")
        print("result\(result)")
        print("answer\(answer)")
        isFirstNumber = true

    }
    
    func pressNumberButton(pressedNumber:Int){
        if answerLabel.text == "0"{
            answerLabel.text = "\(pressedNumber)"
        }else{
            answerLabel.text = answerLabel.text! + "\(pressedNumber)"
        }
        
        inputNumber = Double(answerLabel.text!)!
        
        if isFirstNumber == false{
            if pressOperator == 0{
                result = result + inputNumber
            }else if pressOperator == 1{
                result = result - inputNumber
            }else if pressOperator == 2{
                result = result * inputNumber
            }else if pressOperator == 3{
                result = result / inputNumber
            }
            
        }else{
            result = inputNumber
        }
        
        
        isFirstNumber = false
        
        print("input\(inputNumber)")
        print("result\(result)")
        print("answer\(answer)")

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

