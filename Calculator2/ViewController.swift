//
//  ViewController.swift
//  Calculator2
//
//  Created by KENDRICK ANDREW COSCA on 13/10/2017.
//  Copyright © 2017 KENDRICK ANDREW COSCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblMsg: UILabel!
    private var n1: Float?
    private var n2: Float?
    private var op: Character?
    private var toggle: Bool = false
    
    @IBAction func insertOne(_ sender: Any) {
        self.insertLabel("1");
    }
    @IBAction func insertTwo(_ sender: Any) {
        self.insertLabel("2");
    }
    @IBAction func insertThree(_ sender: Any) {
        self.insertLabel("3");
    }
    @IBAction func insertFour(_ sender: Any) {
        self.insertLabel("4");
    }
    @IBAction func insertFive(_ sender: Any) {
        self.insertLabel("5");
    }
    @IBAction func insertSix(_ sender: Any) {
        self.insertLabel("6");
    }
    @IBAction func insertSeven(_ sender: Any) {
        self.insertLabel("7");
    }
    @IBAction func insertEight(_ sender: Any) {
        self.insertLabel("8");
    }
    @IBAction func insertNine(_ sender: Any) {
        self.insertLabel("9");
    }
    @IBAction func insertZero(_ sender: Any) {
        self.insertLabel("0");
    }
    @IBAction func clearMsg(_ sender: Any) {
        self.toggle = false
        
        var s = lblMsg.text!
        if !s.isEmpty {
            s.remove(at: s.index(before: s.endIndex))
        }
        
        if s.isEmpty {
            s = "0"
        }
        
        lblMsg.text = s
    }
    @IBAction func insertPercentage(_ sender: Any) {
        self.onOpClick("%")
    }
    @IBAction func insertDot(_ sender: Any) {
        self.insertLabel(".");
    }
    @IBAction func AC(_ sender: Any) {
        self.clear()
    }
    @IBAction func insertDivide(_ sender: Any) {
        self.onOpClick("÷")
    }
    @IBAction func insertMultiply(_ sender: Any) {
        self.onOpClick("×")
    }
    @IBAction func insertMinus(_ sender: Any) {
        self.onOpClick("-")
    }
    @IBAction func insertAdd(_ sender: Any) {
        self.onOpClick("+")
    }
    @IBAction func negate(_ sender: Any) {
        self.onOpClick("/")
    }
    @IBAction func insertEquals(_ sender: Any) {
        self.evaluate()
    }
    
    private func insertLabel(_ char: Character) {
        if self.toggle {
            lblMsg.text = "0"
            self.toggle = false
        }
        
        var x = lblMsg.text ?? ""
        if x == "0" && char != "." {
            x = ""
        }
        if let _ = Float(x + String(char)) {
            lblMsg.text = x + String(char)
        }
    }
    
    private func evaluate() {
        if self.op == "%" {
            if let m = self.n1 {
                self.n1 = m / 100.0
                lblMsg.text = String(self.n1!)
                self.op = nil
            }
            return
        }
        
        if self.op == "/" {
            if let m = self.n1 {
                self.n1 = m * -1
                lblMsg.text = String(self.n1!)
                self.op = nil
            }
            return
        }
        
        // n1 and op shoud not be nil
        // n2 should be nil
        if self.n2 == nil && !(self.n1 == nil && self.op == nil) {
            var res: Float?
            
            if let x = lblMsg.text {
                self.n2 = Float(x) ?? 0.0
            }
            
            switch self.op {
            case Character("+")?:
                res = self.n1! + self.n2!
            case Character("-")?:
                res = self.n1! - self.n2!
            case Character("×")?:
                res = self.n1! * self.n2!
            case Character("÷")?:
                res = self.n2! == 0 ? 0.0 : self.n1! / self.n2!
            default:
                break
            }
            
            if let t = res {
                lblMsg.text = String(describing: t)
                self.clear(false)
            }
            
        }
        
    }
    
    private func onOpClick(_ btn: Character) {
        // save number to n1 if no operations
        if self.op == nil, let x = lblMsg.text {
            self.op = btn
            self.n1 = Float(x) ?? 0.0
            // lblRes.text = String(self.n1!)
            self.toggle = true
        }
        
        if (btn == "%") {
            self.toggle = false
            self.evaluate()
        }
        
        if (btn == "/") {
            self.toggle = false
            self.evaluate()
        }
        
    }
    
    private func clear(_ withRes: Bool = true) {
        self.n1 = nil
        self.n2 = nil
        self.op = nil
        
        if withRes {
            lblMsg.text = "0"
        }
        
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

