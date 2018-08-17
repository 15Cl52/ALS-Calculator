//
//  Awaji.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-08-16.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import Foundation


//Global Variables:
var awajiDenervation = [Bool](repeating: false, count: row) //Represents "Active +Chronic Denervation" col of Awaji criteria.

var awajiLmn = [Bool](repeating: false, count: row)
var awajiSame = [Bool](repeating: false, count: row)

var awajiLmnRegion: Int = numberOfRegions(symptomArray: &awajiLmn, indexNumber: 4)
var awajiSameRegion: Int = numberOfRegions(symptomArray: &awajiSame, indexNumber: 4)

var finalResultAwaji: Int = 0

func calculateResultAwaji(){
    
    // A. Initialize awajiDenervation array.
    //=IF(     AND(    OR($D2=TRUE, $E2=TRUE)   ,$F2=TRUE)   ,TRUE,FALSE)
    for i in 0..<row {
        if(fibSwitchStates[i] == true && neuroSwitchStates[i] == true || fasSwitchStates[i] == true && neuroSwitchStates[i] == true){
            awajiDenervation[i] = true
        } else{ awajiDenervation[i] = false }
    }
    
    // B. Initialize awajiLmn array.
    //=IF(     OR(U2=TRUE,L2=TRUE)   ,TRUE, FALSE)
    for i in 0..<row {
        if(awajiDenervation[i] == true || lmnSwitchStates[i] == true){
            awajiLmn[i] = true
        } else{ awajiLmn[i] = false }
    }
    
    // C. Initialize awajiSame array.
    //=IF(    AND(V2=TRUE,K2=TRUE)      ,TRUE, FALSE)
    for i in 0..<row {
        if(umnSwitchStates[i] == true && awajiLmn[i] == true){
            awajiSame[i] = true
        } else{ awajiSame[i] = false }
    }
    
}

/************************* Algorithms ***********************/

func getResultAwaji(boolFound: String) -> String {

    // 1. DETERMINE IF RESULT IS "Clinically Definite":
    //=IF(    OR(   AND($J$3=TRUE,$J$4=TRUE,$J$5=TRUE),    AND($K$2=TRUE,$L$2=TRUE,$K$7>1,$L$7>1))    , $R$16, "")
    if(bothUmnLmn[1] == true && bothUmnLmn[2] == true && bothUmnLmn[3] == true || umnSwitchStates[0] == true && lmnSwitchStates[0] == true && umnNoBulbRegion > 1 && lmnNoBulbRegion > 1) {
        finalResultAwaji = 1
        return "Clinically Definite"
    }
  
    // 2. DETERMINE IF RESULT IS "Clinically Definite FALS Lab Supported":
    //IF(     AND(    OR($K$6>=1,$L$6>=1,$V$6>=1)     ,$B$6=TRUE,R$8=""     ), "Clinically Definite FALS Lab Supported", "")
    if(umnRegion >= 1 && umnGeneIdentified == true && finalResultAwaji == 0 || lmnRegion >= 1 && umnGeneIdentified == true && finalResultAwaji == 0 || awajiLmnRegion >= 1 && umnGeneIdentified == true && finalResultAwaji == 0){
        finalResultAwaji = 1
        return "Clinically Definite FALS Lab Supported"
    }
    
    // 3. DETERMINE IF RESULT IS "Clinically Probable":
    //=IF(AND   ($K$6>1, $V$6>1, $U$8="", $U$9="", $O$8=TRUE, $B$7=TRUE)    ,"Clinically Probable", "")
    if(umnRegion > 1 && awajiLmnRegion > 1 && finalResultAwaji == 0 && boolFound == "true" && umnSignRostral == true){
        finalResultAwaji = 1
        return "Clinically Probable"
    }
    
    // 4. DETERMINE IF RESULT IS "Clinically Possible":
    //=IF(    AND(    OR($W$6>=1,    $K$6>=2)        ,U$8="",$U$9="",U$10=""),"Clinically Possible", "")
    if(awajiSameRegion >= 1 && finalResultAwaji == 0 || umnRegion >= 2 && finalResultAwaji == 0){
        finalResultAwaji = 1
        return "Clinically Possible"
    }

    else{ return "Clinically Possible"}

}

