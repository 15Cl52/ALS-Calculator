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
        checkSwitch(switchOutlet: umnBulbOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Bulb)   //stores the current bulbar switch bool state to array umnSwitchStates
        
        numberOfRegions(symptomArray: &umnSwitchStates, locationNumber: 4) //locationNumber = number of certain locations (bulb, cerv, thor and lumb = 4)
        
    }

    @IBOutlet weak var umnCervOutlet: UISwitch!
    @IBAction func umnCervAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnCervOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Cerv)
        
        numberOfRegions(symptomArray: &umnSwitchStates, locationNumber: 4)

    }

    @IBOutlet weak var umnThorOutlet: UISwitch!
    @IBAction func umnThorAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnThorOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Thor)
        
        numberOfRegions(symptomArray: &umnSwitchStates, locationNumber: 4)
    
    }

    @IBOutlet weak var umnLumbOutlet: UISwitch!
    @IBAction func umnLumbAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnLumbOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Lumb)
        
        numberOfRegions(symptomArray: &umnSwitchStates, locationNumber: 4)
    }

    @IBOutlet weak var umnGeneOutlet: UISwitch!
    @IBAction func umnGeneAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnGeneOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Gene)
        
        numberOfRegions(symptomArray: &umnSwitchStates, locationNumber: 4)

    }

    @IBOutlet weak var umnRosOutlet: UISwitch!
    @IBAction func umnRosAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnRosOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Ros)
        
        numberOfRegions(symptomArray: &umnSwitchStates, locationNumber: 4)

    }

    
}
