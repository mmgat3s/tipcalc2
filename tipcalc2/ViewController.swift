//
//  ViewController.swift
//  tipcalc2
//
//  Created by Maggie Gates on 12/13/15.
//  Copyright © 2015 CodePath. All rights reserved.
//

import UIKit

var lowTip = 0.18
var midTip = 0.20
var highTip = 0.25
var tipPercentages = [lowTip, midTip, highTip]
var party = 1

class ViewController: UIViewController {
    
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var partySize: UILabel!
    @IBOutlet var firstView: UIView!
  
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
        
        TipLabel.text = "$0.00"
        TotalLabel.text = "0.00"
        
        
       let segment = NSUserDefaults.standardUserDefaults()
       segment.integerForKey("defaultPercentKey")
        
        if (0 == segment.integerForKey("defaultPercentKey")){
           tipControl.selectedSegmentIndex = 0
        }else if(1 == segment.integerForKey("defaultPercentKey")){
            tipControl.selectedSegmentIndex = 1
        }else if (2 == segment.integerForKey("defaultPercentKey")){
            tipControl.selectedSegmentIndex = 2
        }
     
    }
        
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    
        
        let segment = NSUserDefaults.standardUserDefaults()
        segment.integerForKey("defaultPercentKey")
        
        if (0 == segment.integerForKey("defaultPercentKey")){
            tipControl.selectedSegmentIndex = 0
        }else if(1 == segment.integerForKey("defaultPercentKey")){
            tipControl.selectedSegmentIndex = 1
        }else if (2 == segment.integerForKey("defaultPercentKey")){
            tipControl.selectedSegmentIndex = 2
        }
    
        var tipPercentages = [lowTip, midTip, highTip]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: BillField.text!).doubleValue
        let tip = billAmount * (tipPercentage)
        let total = billAmount + tip
        let perPerson = total / Double(party)
        
        TipLabel.text = String (format: "$%.2f", tip)
        TotalLabel.text = String (format: "$%.2f", total)
        partyLabel.text =  String (format: "$%.2f", perPerson)
    
    
        partySize.text = party.description
        
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
  
    @IBAction func BillEntered(sender: AnyObject) {
        
        var tipPercentages = [lowTip, midTip, highTip]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: BillField.text!).doubleValue
        let tip = billAmount * (tipPercentage)
        let total = billAmount + tip
        let perPerson = total / Double(party)
        
        TipLabel.text = String (format: "$%.2f", tip)
        TotalLabel.text = String (format: "$%.2f", total)
        partyLabel.text =  String (format: "$%.2f", perPerson)
    }
        
    @IBAction func percentChanged(sender: AnyObject) {
        
        var tipPercentages = [lowTip, midTip, highTip]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: BillField.text!).doubleValue
        let tip = billAmount * (tipPercentage)
        let total = billAmount + tip
        let perPerson = total / Double(party)
        
        TipLabel.text = String (format: "$%.2f", tip)
        TotalLabel.text = String (format: "$%.2f", total)
        partyLabel.text =  String (format: "$%.2f", perPerson)
    }
    
    
    
    
   @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    
    
    
}


