//
//  FibViewController.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-07-13.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import UIKit

class FibViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var fibBulbOutlet: UISwitch!
    @IBAction func fibBulbAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: fibBulbOutlet, symptomArray: &fibSwitchStates, symptomLocation: typeOfSwitch.Bulb)
    }
    
    @IBOutlet weak var fibCervOutlet: UISwitch!
    @IBAction func fibCervAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: fibCervOutlet, symptomArray: &fibSwitchStates, symptomLocation: typeOfSwitch.Cerv)
    }
    
    @IBOutlet weak var fibThorOutlet: UISwitch!
    @IBAction func fibThorAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: fibThorOutlet, symptomArray: &fibSwitchStates, symptomLocation: typeOfSwitch.Thor)
    }
    
    @IBOutlet weak var fibLumbOutlet: UISwitch!
    @IBAction func fibLumbAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: fibLumbOutlet, symptomArray: &fibSwitchStates, symptomLocation: typeOfSwitch.Lumb)
    }

}
