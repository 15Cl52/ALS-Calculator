//
//  NeuroViewController.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-07-13.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import UIKit

class NeuroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var neuroSwitchStates = [Bool](repeating: false, count: 4)
    
    @IBOutlet weak var neuroBulbOutlet: UISwitch!
    @IBAction func neuroBulbAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: neuroBulbOutlet, symptomArray: &neuroSwitchStates, symptomLocation: typeOfSwitch.Bulb)
    }
    
    @IBOutlet weak var neuroCervOutlet: UISwitch!
    @IBAction func neuroCervAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: neuroCervOutlet, symptomArray: &neuroSwitchStates, symptomLocation: typeOfSwitch.Cerv)
    }
    
    @IBOutlet weak var neuroThorOutlet: UISwitch!
    @IBAction func neuroThorAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: neuroThorOutlet, symptomArray: &neuroSwitchStates, symptomLocation: typeOfSwitch.Thor)
    }
    
    @IBOutlet weak var neuroLumbOutlet: UISwitch!
    @IBAction func neuroLumbAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: neuroLumbOutlet, symptomArray: &neuroSwitchStates, symptomLocation: typeOfSwitch.Lumb)
    }
    


}
