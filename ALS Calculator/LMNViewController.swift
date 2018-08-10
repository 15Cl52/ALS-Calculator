//
//  LmnViewController.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-08-09.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import UIKit

class LmnViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//Store current switch bool states in an array designated for the umn view controller only:
    
    var lmnSwitchStates: [Bool] = []
    
    @IBOutlet weak var lmnBulbOutlet: UISwitch!
    @IBAction func lmnBulbAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: lmnBulbOutlet, symptomArray: &lmnSwitchStates, symptomLocation: typeOfSwitch.Bulb)
    }
    
    @IBOutlet weak var lmnCervOutlet: UISwitch!
    @IBAction func lmnCervAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: lmnCervOutlet, symptomArray: &lmnSwitchStates, symptomLocation: typeOfSwitch.Cerv)
    }
    
    @IBOutlet weak var lmnThorOutlet: UISwitch!
    @IBAction func lmnThorAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: lmnThorOutlet, symptomArray: &lmnSwitchStates, symptomLocation: typeOfSwitch.Thor)
    }
    
    @IBOutlet weak var lmnLumbOutlet: UISwitch!
    @IBAction func lmnLumbAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: lmnLumbOutlet, symptomArray: &lmnSwitchStates, symptomLocation: typeOfSwitch.Lum)
    }
    
}
