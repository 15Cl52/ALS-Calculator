//
//  AirlieHouse.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-08-16.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import Foundation

//var umnSwitchStates = [Bool](repeating: false, count: 6) //6 switches total on UMN view controller
//var lmnSwitchStates = [Bool](repeating: false, count: 4)
//var fibSwitchStates = [Bool](repeating: false, count: 4)
//var fasSwitchStates = [Bool](repeating: false, count: 4)
//var neuroSwitchStates = [Bool](repeating: false, count: 4)

//Global Variables:

var airlieDenervation = [Bool](repeating: false, count: row)

var airlieDenRegion: Int = numberOfRegions(symptomArray: &airlieDenervation, indexNumber: 4)

var finalResultAirlie: Int = 0 //represents if a result has been found/calculated yet



func calculateResultAirlie(){
    
    // A. Initialize airlieDenervation array.
    for i in 0..<row {
        if(fibSwitchStates[i] == true && neuroSwitchStates[i] == true){
            airlieDenervation[i] = true
        } else{ airlieDenervation[i] = false }
    }
    
}

/************************* Algorithms ***********************/

func getResultAirlie(boolFound: String) -> String {
    
    // 1. DETERMINE IF RESULT IS "Clinically Definite":
    // =IF(  OR(     AND($J$3=TRUE,$J$4=TRUE,$J$5=TRUE), AND($K$2=TRUE,$L$2=TRUE,$K$7>1,$L$7>1)       ),     $R$16, "")
    if(bothUmnLmn[1] == true && bothUmnLmn[2] == true && bothUmnLmn[3] == true || umnSwitchStates[0] == true && lmnSwitchStates[0] == true && umnNoBulbRegion > 1 && lmnNoBulbRegion > 1){
        finalResultAirlie = 1
        return "Clinically Definite"
    }
    
    // 2. DETERMINE IF RESULT IS "Clinically Definite FALS Lab Supported":
    // =IF(   AND( OR($K$6>=1,$L$6>=1), $B$6=TRUE, R$8="" )            , "Clinically Definite FALS Lab Supported", "")
    if(umnRegion >= 1 && umnGeneIdentified == true && finalResultAirlie == 0 || lmnRegion >= 1 && umnGeneIdentified == true && finalResultAirlie == 0){
        finalResultAirlie = 1
        return "Clinically Definite FALS Lab Supported"
    }
    
    // 3. DETERMINE IF RESULT IS "Clinically Probable":
    // =IF(          AND(     $K$6>1 , $L$6>1, $R$8="", $R$9="", $O$8=TRUE, $B$7=TRUE   )         ,"Clinically Probable", "")
    if(umnRegion > 1 && lmnRegion > 1 && finalResultAirlie == 0 && boolFound == "true" && umnSignRostral == true){
        finalResultAirlie = 1
        return "Clinically Definite FALS Lab Supported"
    }
    
    // 4. DETERMINE IF RESULT IS "Clinically Probable Lab Supported":
    //=IF(          AND($K$6>=1, $R$6>1, $R$8="", $R$9="", $R$10="")           ,"Clinically Probable - Lab Supported", "")
    if(umnRegion >= 1 && airlieDenRegion > 1 && finalResultAirlie == 0){
        finalResultAirlie = 1
        return "Clinically Probable Lab Supported"
    }
    
    // 5. DETERMINE IF RESULT IS "Clinically Possible":
    //=IF(        AND(    OR($J$6>=1,$K$6>=2)     ,R$8="",$R$9="",R$10="",R$11="")   ,"Clinically Possible", "")
    if(umnLmnRegion >= 1 && finalResultAirlie == 0 || umnRegion >= 2 && finalResultAirlie == 0){
        finalResultAirlie = 1
        return "Clinically Probable"
    }
    
    else{ return "Clinically Possible"}
}


