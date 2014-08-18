//
//  ViewController.swift
//  tippy
//
//  Created by Hi_Hu on 8/17/14.
//  Copyright (c) 2014 hi_hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var resultsView: UIView!
    
    @IBOutlet weak var dollarSign: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        self.resultsView.alpha = 0
        self.tipControl.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        if self.resultsView.alpha == 0 {
            UIView.animateWithDuration(0.8, animations: {
                self.resultsView.frame.offset(dx: 0, dy: -140)
                self.resultsView.alpha = 1
                
                self.tipControl.frame.offset(dx: 0, dy: -200)
                self.tipControl.alpha = 1
                
                self.billField.frame.offset(dx: 0, dy: -176)
            })

            UIView.animateWithDuration(0.1, animations: {
                self.dollarSign.alpha = 0
            })
        }

        if self.billField.text == "" {
            UIView.animateWithDuration(0.8, animations: {
                self.resultsView.frame.offset(dx: 0, dy: 140)
                self.resultsView.alpha = 0
                
                self.tipControl.frame.offset(dx: 0, dy: 200)
                self.tipControl.alpha = 0
                
                self.billField.frame.offset(dx: 0, dy: 176)
            })
            
            UIView.animateWithDuration(2, animations: {
                self.dollarSign.alpha = 1
            })
        }
        
        var tipPercentages = [0.15, 0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

