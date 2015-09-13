//
//  TipViewController.swift
//  Tip Calculator
//
//  Created by Clover on 8/9/15.
//
//

import UIKit

class TipViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var tipPercentages = [0.15, 0.2, 0.25]
    
    var formatter = NSNumberFormatter()
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        formatter.locale = NSLocale.currentLocale()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.alwaysShowsDecimalSeparator = true
        formatter.numberStyle = .CurrencyStyle
    }
    
    // MARK: Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Bill Amount is the first responder
        billField.becomeFirstResponder()
        
        // Load tip default
        if (defaults.objectForKey("tipDefault") != nil) {
            tipControl.selectedSegmentIndex = defaults.objectForKey("tipDefault") as! Int
        }
        
        // Set amount to 0.00
        tipLabel.text = formatter.stringFromNumber(0)
        totalLabel.text = formatter.stringFromNumber(0)
    }

    override func viewDidAppear(animated: Bool) {
        // Bill Amount is the first responder
        billField.becomeFirstResponder()
        
        // Currency Formatting
        formatter.locale = NSLocale.currentLocale()
    }
    
    override func viewWillAppear(animated: Bool) {
        // Load tip default
        if (defaults.objectForKey("tipDefault") != nil) {
            tipControl.selectedSegmentIndex = defaults.objectForKey("tipDefault") as! Int
        }
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip

        // Currency Formatting
        formatter.locale = NSLocale.currentLocale()
        
        // Change text
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: IBAction
    @IBAction func onEdittingChanged(sender: AnyObject) {
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        // Currency Formatting
        formatter.locale = NSLocale.currentLocale()
        
        // Change text
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        
    }
    // The keyboard is always visible. We do not need this any longer!
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "Back"
    }
}

