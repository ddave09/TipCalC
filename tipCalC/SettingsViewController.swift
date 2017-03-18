//
//  SettingsViewController.swift
//  tipCalC
//
//  Created by Darshit Dave on 3/3/17.
//  Copyright © 2017 Darshit Dave. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var statePicker: UIPickerView!

    let tax = [
        0,
        0.04,
        0,
        0.056,
        0.065,
        0.075,
        0.029,
        0.0635,
        0,
        0.06,
        0.04,
        0.04,
        0.06,
        0.0625,
        0.07,
        0.06,
        0.065,
        0.06,
        0.04,
        0.055,
        0.06,
        0.0625,
        0.06,
        0.0688,
        0.07,
        0.0423,
        0,
        0,055,
        0,0685,
        0,
        0.07,
        0.0513,
        0.04,
        0.0475,
        0.05,
        0.0575,
        0.045,
        0,
        0.06,
        0.07,
        0.06,
        0.04,
        0.07,
        0.0625,
        0.0595,
        0.06,
        0.053,
        0.065,
        0.06,
        0.05,
        0.04,
        0.0575
    ]
    
    let states = [
        "Select One",
        "Alabama (4.00%)",
        "Alaska (0%)",
        "Arizona (5.60%)",
        "Arkansas (6.50)",
        "California (7.50%)",
        "Colorado (2.90%)",
        "Connecticut (6.35%)",
        "Delaware (0%)",
        "Florida (6.00%)",
        "Georgia (4.00%)",
        "Hawaii (4.00%)",
        "Idaho (6.00%)",
        "Illinois (6.25%)",
        "Indiana (7.00%)",
        "Iowa (6.00%)",
        "Kansas (6.50%)",
        "Kentucky (6.00%)",
        "Louisiana (4.00%)",
        "Maine (5.50%)",
        "Maryland (6.00%)",
        "Massachusetts (6.25%)",
        "Michigan (6.00%)",
        "Minnesota (6.88%)",
        "Mississippi (7.00%)",
        "Missouri (4.23%)",
        "Montana (0%)",
        "Nebraska (5.50%)",
        "Nevada (6.85%)",
        "New Hampshire (0%)",
        "New Jersey (7.00%)",
        "New Mexico (5.13%)",
        "New York (4.00%)",
        "North Carolina (4.75%)",
        "North Dakota (5.00%)",
        "Ohio (5.75%)",
        "Oklahoma (4.50%)",
        "Oregon (0%)",
        "Pennsylvania (6.00%)",
        "Rhode Island (7.00%)",
        "South Carolina (6.00%)",
        "South Dakota (4.00%)",
        "Tennessee (7.00%)",
        "Texas (6.25%)",
        "Utah (5.95%)",
        "Vermont (6.00%)",
        "Virginia (5.30%)",
        "Washington (6.50%)",
        "West Virginia (6.00%)",
        "Wisconsin (5.00%)",
        "Wyoming (4.00%)",
        "D.C. (5.75%)"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "tipSegmentIndex")
        tipSegment.selectedSegmentIndex = defaultTipIndex
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        statePicker.selectRow(defaults.integer(forKey: "pickerIndex"), inComponent: 0, animated: true)
    }
    
    @IBAction func tipControl(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(tipSegment.selectedSegmentIndex, forKey: "tipSegmentIndex")
        defaults.synchronize()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let defaults = UserDefaults.standard
        defaults.set(tax[row], forKey: "stateTax")
        defaults.set(row, forKey: "pickerIndex")
    }
    
}
