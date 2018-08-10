//
//  UmnViewController.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-07-13.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import UIKit

enum typeOfSwitch : Int{
    case Bulb, Cerv, Thor, Lum, Gene, Ros
}

func checkSwitch (switchOutlet: UISwitch, symptomArray: inout [Bool], symptomLocation: typeOfSwitch){
    //Global function that checks switch state and stores that value in desired array that holds all switch values for that view controller
    
    if switchOutlet.isOn == true {
        symptomArray[symptomLocation.rawValue] = true   //depending on switch, bool value is placed at corresponding array index
        print(symptomArray)
    }
    else{
        symptomArray[symptomLocation.rawValue] = false
        print(symptomArray)
    }
}

class UmnViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//Store current switch bool states in an array designated for the umn view controller only:
    var umnSwitchStates = [Bool](repeating: false, count: 6) //6 switches total on UMN view controller
    
    @IBOutlet weak var umnBulbOutlet: UISwitch!
    @IBAction func umnBulbAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnBulbOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Bulb)   //stores the current bulbar switch bool state to array umnSwitchStates
    }
    
    
    
    @IBOutlet weak var umnCervOutlet: UISwitch!
    @IBAction func umnCervAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnCervOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Cerv)
    }

    @IBOutlet weak var umnThorOutlet: UISwitch!
    @IBAction func umnThorAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnThorOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Thor)
    }

    @IBOutlet weak var umnLumOutlet: UISwitch!
    @IBAction func umnLumAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnLumOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Lum)
    }

    @IBOutlet weak var umnGeneOutlet: UISwitch!
    @IBAction func umnGeneAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnGeneOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Gene)
    }

    @IBOutlet weak var umnRosOutlet: UISwitch!
    @IBAction func umnRosAction(_ sender: UISwitch) {
        checkSwitch(switchOutlet: umnRosOutlet, symptomArray: &umnSwitchStates, symptomLocation: typeOfSwitch.Ros)
    }


}
