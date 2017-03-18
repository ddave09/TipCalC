//
//  ViewController.swift
//  tipCalC
//
//  Created by Darshit Dave on 3/1/17.
//  Copyright © 2017 Darshit Dave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var taxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "tipSegmentIndex")
        let defaultStateTax = defaults.float(forKey: "stateTax")*100
        
        taxLabel.text = String(format: "%.2f%%", defaultStateTax)
        tipControl.selectedSegmentIndex = defaultTipIndex
        Calculate(self)
    }

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func Calculate(_ sender: AnyObject) {
        let tipfraction = [0.15, 0.20, 0.25]
        let defaults = UserDefaults.standard
        let tax = defaults.double(forKey: "stateTax")
        
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipfraction[tipControl.selectedSegmentIndex]
        let stateTax = bill * tax;
        
        let total = bill + tip + stateTax
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

