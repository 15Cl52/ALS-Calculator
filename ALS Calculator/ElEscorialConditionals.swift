/*
import Foundation

//true == 1, false == 0

//create a matrix ("uiTable") to represent input table UI as seen below..
/*                      | UMN      |  LMN  |  fib.../PSW | fascic... | neur...denervation |
 bulbar                 |  R0,C0   | R0,C1 |       ?     |       ?   |       R0, C4       |
 cervical               |  R1,C0   |   ?   |       ?     |       ?   |       ?            |
 thoracic               |  R2,C0   |   ?   |       ?     |       ?   |       ?            |
 lumbosacral            |  R3,C0   |   ?   |       ?     |       ?   |       ?            |

 family-history...      |  R?,C?   |   ?   |       ?     |       ?   |       ?            |
 UMN-rostral_LMN...     |  R?,C?   |   ?   |       ?     |       ?   |       ?            |
 */


let row = 4 //rows
//let col = 5 // cols

//var umnSwitchStates = [Bool](repeating: false, count: 6) //6 switches total on UMN view controller
//var lmnSwitchStates = [Bool](repeating: false, count: 4)
//var fibSwitchStates = [Bool](repeating: false, count: 4)
//var fasSwitchStates = [Bool](repeating: false, count: 4)
//var neuroSwitchStates = [Bool](repeating: false, count: 4)


func numberOfRegions(symptomArray: inout [Bool], locationNumber: Int) -> Int{
    //Counts how many 'true' values are in a symptomArray.
    var regionCount = 0
    for i in 0..<locationNumber {
        if(symptomArray[i] == true){
            regionCount = regionCount + 1
        }
    }
    //print(regionCount) //delete later
    return regionCount
}


struct Result {

    init() {
    //******************************** Setting up inputs - part 1 ******************************************
        //Variables:
        var bothUmnLmn = [Bool](repeating: false, count: row) //can access this property of the Result class later in another class!

        var umnLmnRegion = numberOfRegions(symptomArray: &bothUmnLmn, locationNumber: 4) //int type
        var umnRegion = numberOfRegions(symptomArray: &umnSwitchStates, locationNumber: 4)
        var lmnRegion = numberOfRegions(symptomArray: &lmnSwitchStates, locationNumber: 4)
        
        //Gets number of regions/instances where umn array has a true value stored - number of regions/instances where umn array has a true value stored without accounting for the bulbar region
        var umnNoBulbRegion = umnRegion - numberOfRegions(symptomArray: &umnSwitchStates, locationNumber: 1) //int type
        var lmnNoBulbRegion = lmnRegion - numberOfRegions(symptomArray: &lmnSwitchStates, locationNumber: 1)
        
        var greaterUmn = [Bool](repeating: false, count: row) //UMN>=LMN algorithm previously created (returns true or false)
        var greaterUmnBlank = [Int](repeating: 0, count: row)
        
        var greaterUmnCheckCount = 0 //false
        var bulbarBlank = 0 //
        
        var finalResult = 0 //represents if a result has been found/calculated yet

        var boolFound: Bool

        

        
        // A. Initialize bothUmnLmn array. (Calculate number of times when umn and lmn are both true, number of times when umn is true, and number of times lmn is true.)
        
        for i in 0..<row {
            if(umnSwitchStates[i] == true && lmnSwitchStates[i] == true){
                bothUmnLmn[i] = true
            } else{ bothUmnLmn[i] = false }
        }
        
        // B. Initialize greaterUmn array.

        for i in 0..<row {
            if(umnSwitchStates[i] == true && lmnSwitchStates[i] == true || umnSwitchStates[i] == true && lmnSwitchStates[i] == false){
                greaterUmn[i] = true
            } else{ greaterUmn[i] = false }
        }
        
        // C. Initialize greaterUmnBlank array.
            //let blank = 2, true = 1, false = 0
        
        for i in 0..<row {
            if(umnSwitchStates[i] == false && lmnSwitchStates[i] == true){
                greaterUmnBlank[i] = 0 //false
            }
            if(umnSwitchStates[i] == true && lmnSwitchStates[i] == true || umnSwitchStates[i] == true && lmnSwitchStates[i] == false){
                 greaterUmnBlank[i] = 1 //true
                
            }
            if(umnSwitchStates[i] == false && lmnSwitchStates[i] == false){
                greaterUmnBlank[i] = 2 //blank
            }
        }
        
        
        // D. Find the first non-blank value (either 'true' or 'false'). The 'boolFound' is then used as the UMN>=LMN state.
        for i in 0..<row {
            //If the element in the array does NOT have a blank...
            if(greaterUmnBlank[i] != 2){
                if(greaterUmnBlank[i] == 0){
                    boolFound = false
                }else{
                    boolFound = true
                }
            }
        }
        
        
        



        
   
        
        

        
        
        
        
    /********************************************** Algorithms *********************************************/

    // 1. DETERMINE IF RESULT IS "DEFINITE":
        
        //=IF( OR(AND($J$3=TRUE,$J$4=TRUE,$J$5=TRUE),AND($K$2=TRUE,$L$2=TRUE,$K$7>1,$L$7>1) ), "Definite", "")
        if(bothUmnLmn[1] == true && bothUmnLmn[2] == true && bothUmnLmn[3] == true || umnSwitchStates[0] == true && lmnSwitchStates[0] == true && umnNoBulbRegion > 1 && lmnNoBulbRegion > 1){
            
            finalResult = 1
            print("Definite")
        }
        
    //2. DETERMINE IF RESULT IS "PROBABLE".
        
         //=IF(AND($K$6>1,$L$6>1,$J$8="",$O$8=TRUE,$B$7=TRUE),"Probable", "")
         if(umnRegion > 1 && lmnRegion > 1 && finalResult == 0 && boolFound == true && umnSwitchStates[5] == true){
            finalResult = 1
            print("Probable")
         }
   
        
        
    }
}
        
        
        
        
        





///********************************************** Algorithms *********************************************/
//
//var finalResult = 0; //represents if a result has been found/calculated yet
//
////Definite:
////=IF( OR(AND($J$3=TRUE,$J$4=TRUE,$J$5=TRUE),AND($K$2=TRUE,$L$2=TRUE,$K$7>1,$L$7>1) ), "Definite", "")
//if(bothUmnLmn[1] == true && bothUmnLmn[2] == true && bothUmnLmn[3] == true || umnUICol[0] == true && lmnUICol[0] == true && umnNoBulb>1 && lmnNoBulb>1){
//    finalResult = 1
//    print("Definite")
//} else{ print("N/A") }
//
//
///*
// //Probable:
// //=IF(AND($K$6>1,$L$6>1,$J$8="",$O$8=TRUE,$B$7=TRUE),"Probable", "")
// if(umnRegion>1 && lmnRegion>1 && finalResult == 0 && ){
// print("Probable")
// } else{ print("N/A") }
//
// */
//
////Possible
////=IF(      AND(    OR($J$6>=1,$K$6>=2),J$8="",J$9=""   ),"Possible", ""    )
//var possibleCounter = 0
//if( umnLmnRegion >= 1 && lmnRegion >=2 ){
//    possibleCounter = 1
//}
//if( possibleCounter == 1 && finalResult == 0 ){
//    print("Possible")
//    finalResult = 1
//} else{ print("N/A") }
//
////Suspected
////=IF(AND(L$6>=2,J$8="",J$9="",J$10=""),"Suspected", "")
//if( lmnRegion >=2 && finalResult ==0){
//    print("Suspected")
//    finalResult = 1
//} else{ print("N/A")}
//
//
//
//
 
 
 
 /*
