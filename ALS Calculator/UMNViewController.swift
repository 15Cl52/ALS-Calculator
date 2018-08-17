//
//  UmnViewController.swift/Users/Cassandra/Desktop/ALS Calculator App/ALS Calculator/ALS Calculator.xcodeproj
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-07-13.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import UIKit

class UmnViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var umnBulbOutlet: UISwitch!
    @IBAction func umnBulbAction(_ sender: UISwitch) {
        //stores the current bulbar switch bool state to array umnSwitchStates
        storeSwitch(switchOutlet: umnBulbOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Bulb)
    }

    @IBOutlet weak var umnCervOutlet: UISwitch!
    @IBAction func umnCervAction(_ sender: UISwitch) {
        storeSwitch(switchOutlet: umnCervOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Cerv)
        
    }

    @IBOutlet weak var umnThorOutlet: UISwitch!
    @IBAction func umnThorAction(_ sender: UISwitch) {
        storeSwitch(switchOutlet: umnThorOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Thor)
 
    }

    @IBOutlet weak var umnLumbOutlet: UISwitch!
    @IBAction func umnLumbAction(_ sender: UISwitch) {
        storeSwitch(switchOutlet: umnLumbOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Lumb)
 
    }

    @IBOutlet weak var umnGeneOutlet: UISwitch!
    @IBAction func umnGeneAction(_ sender: UISwitch) {
        storeSwitch(switchOutlet: umnGeneOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Gene)
        
    }

    @IBOutlet weak var umnRosOutlet: UISwitch!
    @IBAction func umnRosAction(_ sender: UISwitch) {
        storeSwitch(switchOutlet: umnRosOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Ros)
        
    }
    
}
