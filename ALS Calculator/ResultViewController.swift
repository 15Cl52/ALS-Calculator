//
//  ResultViewController.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-07-13.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import UIKit


var boolGot: String = ""
var escorialResult: String = ""
var airlieResult: String = ""
var awajiResult: String = ""


class ResultViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //EscorialLabel.text = escorialResult
        
        //AirlieLabel.text = airlieResult   //UNCOMMENT
        //AwajiLabel.text = awajiResult     //UNCOMMENT
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var EscorialLabel: UILabel!
    @IBOutlet weak var AirlieLabel: UILabel!
    @IBOutlet weak var AwajiLabel: UILabel!
    
    
}
