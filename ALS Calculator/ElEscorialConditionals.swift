
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


class Result {

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

        var finalResult = 0 //represents if a result has been found/calculated yet

        

        // A. Initialize bothUmnLmn array. (Calculate number of times when umn and lmn are both true, number of times when umn is true, and number of times lmn is true.)
        
        for i in 0..<row {
            if(umnSwitchStates[i] == true && lmnSwitchStates[i] == true){
                bothUmnLmn[i] = true
            } else{ bothUmnLmn[i] = false }
        }
        
        // B. The following 3 for statements are a recreation of the excel alogarithms created for UMN>=LMN case:
        // B.i. Initialize greaterUmn array:

        for i in 0..<row {
            if(umnSwitchStates[i] == true && lmnSwitchStates[i] == true || umnSwitchStates[i] == true && lmnSwitchStates[i] == false){ 
                greaterUmn[i] = true
            } else{ greaterUmn[i] = false }
        }
        
        // 2. UMN >= LMN (col 2):
        //for i in 0..<col {
        //    //=IF(AND($M2=TRUE,$B2=FALSE,$C2=FALSE),"BLANK","")
        //    if(moreUmn[i] == true && umnUICol[i] == false && lmnUICol[i] == false){
        //        moreUmnBlk[i] = true
        //    }
        //}
        //
        ////3. Right-most col of El Escorial table:

        
        
        
        
    /********************************************** Algorithms *********************************************/

    // 1. DETERMINE IF RESULT IS "DEFINITE":
        
        //=IF( OR(AND($J$3=TRUE,$J$4=TRUE,$J$5=TRUE),AND($K$2=TRUE,$L$2=TRUE,$K$7>1,$L$7>1) ), "Definite", "")
        if(bothUmnLmn[1] == true && bothUmnLmn[2] == true && bothUmnLmn[3] == true || umnSwitchStates[0] == true && lmnSwitchStates[0] == true && umnNoBulbRegion > 1 && lmnNoBulbRegion > 1){
            
            finalResult = 1
            print("Definite")
        }
        
    //2. DETERMINE IF RESULT IS "PROBABLE".
        
         //=IF(AND($K$6>1,$L$6>1,$J$8="",$O$8=TRUE,$B$7=TRUE),"Probable", "")
         if(umnRegion > 1 && lmnRegion > 1 && finalResult == 0 && ){
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
 
 
