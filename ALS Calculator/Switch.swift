//
//  Switch.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-08-09.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//


//This file will hold all global functions and variables that I want to use in mutliple view controller classes.

import Foundation
import UIKit

enum typeOfSwitch : Int{
    //Certain switch type corresponds to certain integer which we use to index symptomArrray so we can store the bool state of each switch
    case Bulb, Cerv, Thor, Lumb, Gene, Ros
}

//Store current switch bool states in an array designated for the umn view controller only:
var umnSwitchStates = [Bool](repeating: false, count: 6) //6 switches total on UMN view controller
var lmnSwitchStates = [Bool](repeating: false, count: 4)
var fibSwitchStates = [Bool](repeating: false, count: 4)
var fasSwitchStates = [Bool](repeating: false, count: 4)
var neuroSwitchStates = [Bool](repeating: false, count: 4)





func storeSwitch (switchOutlet: UISwitch, symptomArray: inout [Bool], symptomLocation: typeOfSwitch){
    //Global function that checks switch state and stores that value in desired array that holds all switch values for that view controller

    if switchOutlet.isOn == true {
        symptomArray[symptomLocation.rawValue] = true   //depending on switch, bool value is placed at corresponding array index
   
        //print(symptomArray) //DELETE
    }
    else{
        symptomArray[symptomLocation.rawValue] = false
        
        //print(symptomArray) //DELETE
    }

}


func numberOfRegions(symptomArray: inout [Bool], indexNumber: Int) -> Int{
    //Counts how many 'true' values are in a symptomArray.
    //locationNumber == how deep into the array you want to look into (ie look into the array until the element at 'indexNumber' index)
    
    var regionCount = 0
    for i in 0..<indexNumber {
        if(symptomArray[i] == true){
            regionCount = regionCount + 1
        }
    }
    
    return regionCount
    
    //print(regionCount) //DELETE
}


//true == 1, false == 0

//create a matrix ("uiTable") to represent input table UI as seen below..
/*                      | UMN      |  LMN  |  fib.../PSW | fascic... | neur...denervation |
 bulbar                 |  R0,C0   | R0,C1 |       ?     |       ?   |       R0, C4       |
 cervical               |  R1,C0   |   ?   |       ?     |       ?   |       ?            |
 thoracic               |  R2,C0   |   ?   |       ?     |       ?   |       ?            |
 lumbosacral            |  R3,C0   |   ?   |       ?     |       ?   |       ?            |
 
 family-history...      |  R4,C?   |   ?   |       ?     |       ?   |       ?            |
 UMN-rostral_LMN...     |  R5,C?   |   ?   |       ?     |       ?   |       ?            |
 */


let row = 4 //rows

//var umnSwitchStates = [Bool](repeating: false, count: 6) //6 switches total on UMN view controller
//var lmnSwitchStates = [Bool](repeating: false, count: 4)
//var fibSwitchStates = [Bool](repeating: false, count: 4)
//var fasSwitchStates = [Bool](repeating: false, count: 4)
//var neuroSwitchStates = [Bool](repeating: false, count: 4)


//Global Variables:

var umnGeneIdentified: Bool = umnSwitchStates[4] //Represents "Gene Identified Family History with Progressive Symptoms" cell
var umnSignRostral: Bool = umnSwitchStates[5] //Represents "UMN signs rostral to (above) the LMN signs" cell

//Stores element as 'true' if umn == true and lmn == true in respective bulbar, cervical, thoracic,... switches:
var bothUmnLmn = [Bool](repeating: false, count: row) //Represents "UMN+LMN" column

//Gets number of regions/instances where umn array has a true value stored:
var umnLmnRegion: Int = numberOfRegions(symptomArray: &bothUmnLmn, indexNumber: 4)  //Represents "# of Regions" cell for "UMN+LMN" col
var umnRegion: Int = numberOfRegions(symptomArray: &umnSwitchStates, indexNumber: 4) //Represents "# of Regions" cell for "UMN" col
var lmnRegion: Int = numberOfRegions(symptomArray: &lmnSwitchStates, indexNumber: 4) //Represents "# of Regions" cell for "LMN" col

//Gets number of regions/instances where umn array has a true value stored - number of regions/instances where umn array has a true value stored without accounting for the bulbar region:
var umnNoBulbRegion: Int = umnRegion - numberOfRegions(symptomArray: &umnSwitchStates, indexNumber: 1) //Represents "# of Regions" cell for "UMN" col without counting the 'bulbar' cell
var lmnNoBulbRegion: Int = lmnRegion - numberOfRegions(symptomArray: &lmnSwitchStates, indexNumber: 1)


var greaterUmn = [Bool](repeating: false, count: row) //Represents "UMN>=LMN" col
var greaterUmnBlank = [Int](repeating: 0, count: row) //Used to determine if UMN>=LMN and the special case where UMN and LMN are both false (if both false == blank)

var finalResultEscorial: Int = 0 //represents if a result has been found/calculated yet


var boolFound: String = "n/a" //Represents "UMN>=LMN" single cell. Holds either "true", "false" or "n/a"






