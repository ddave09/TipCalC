//
//  SettingsViewController.swift
//  tipCalC
//
//  Created by Darshit Dave on 3/3/17.
//  Copyright © 2017 Darshit Dave. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func tipControl(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(tipSegment.selectedSegmentIndex, forKey: "tipSegmentIndex")
        defaults.synchronize()
    }
}
