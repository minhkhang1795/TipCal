//
//  SettingViewController.swift
//  Tip Calculator
//
//  Created by Clover on 8/9/15.
//
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tipDefaultControl: UISegmentedControl!
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load tip default
        if (defaults.objectForKey("tipDefault") != nil) {
            tipDefaultControl.selectedSegmentIndex = defaults.objectForKey("tipDefault") as! Int
        }
    }
    
    @IBAction func onPercentChanged(sender: AnyObject) {
        // Save tip default
        defaults.setInteger(tipDefaultControl.selectedSegmentIndex, forKey: "tipDefault")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
