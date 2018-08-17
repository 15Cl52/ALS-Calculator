//
//  FasViewController.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-07-13.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import UIKit

class FasViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBOutlet weak var fasBulbOutlet: UISwitch!
    @IBAction func fasBulbAction(_ sender: UISwitch) {
        storeSwitch(switchOutlet: fasBulbOutlet, symptomArray: &fasSwitchStates, symptomLocation: typeOfSwitch.Bulb)
    }
    
    @IBOutlet weak var fasCervOutlet: UISwitch!
    @IBAction func fasCervAction(_ sender: UISwitch) {
        storeSwitch(switchOutlet: fasCervOutlet, symptomArray: &fasSwitchStates, symptomLocation: typeOfSwitch.Cerv)
    }
    
    @IBOutlet weak var fasThorOutlet: UISwitch!
    @IBAction func fasThorAction(_ sender: UISwitch) {
        storeSwitch(switchOutlet: fasThorOutlet, symptomArray: &fasSwitchStates, symptomLocation: typeOfSwitch.Thor)
    }
    
    @IBOutlet weak var fasLumbOutlet: UISwitch!
    @IBAction func fasLumbAction(_ sender: UISwitch) {
        storeSwitch(switchOutlet: fasLumbOutlet, symptomArray: &fasSwitchStates, symptomLocation: typeOfSwitch.Lumb)
    }


}
