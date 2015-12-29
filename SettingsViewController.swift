//
//  SettingsViewController.swift
//  tipcalc2
//
//  Created by Maggie Gates on 12/14/15.
//  Copyright © 2015 CodePath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultPercentSegment: UISegmentedControl!
    @IBOutlet weak var partyNumberSlider: UISlider!
    @IBOutlet weak var partyNumberLabel: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let segment = NSUserDefaults.standardUserDefaults()
        defaultPercentSegment.selectedSegmentIndex = segment.integerForKey("defaultPercentKey")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController
        // Pass the selected object to the new view controller.
    }

    @IBAction func defaultChooseSegment(sender: AnyObject) {
        
        var tipPercentages = [lowTip, midTip, highTip]
        let _ = tipPercentages[defaultPercentSegment.selectedSegmentIndex]
        
        
        let segment = NSUserDefaults.standardUserDefaults()
        if (sender.selectedSegmentIndex == 0){
            segment.setInteger(0, forKey: "defaultPercentKey")
        }else if (sender.selectedSegmentIndex == 1){
            segment.setInteger(1, forKey: "defaultPercentKey")
        }else if(sender.selectedSegmentIndex == 2) {
            segment.setInteger(2, forKey:"defaultPercentKey")
        }
        segment.synchronize()
    }

   
    @IBAction func partySizeChanged(sender: UISlider) {
        let currentValue = String(Int(sender.value))
        partyNumberLabel.text = "\(currentValue)"
    
        party = Int(partyNumberLabel.text!)!
        
    }
    
}


