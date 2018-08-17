
import Foundation

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
var lmnNoBulbRegion: Int = lmnRegion - numberOfRegions(symptomArray: &lmnSwitchStates, indexNumber: 1) //Represents "# of Regions" cell for "LMN" col without counting the 'bulbar' cell


var greaterUmn = [Bool](repeating: false, count: row) //Represents "UMN>=LMN" col
var greaterUmnBlank = [Int](repeating: 0, count: row) //Used to determine if UMN>=LMN and the special case where UMN and LMN are both false (if both false == blank)

var finalResultEscorial: Int = 0 //represents if a result has been found/calculated yet


var boolFound: String = "n/a" //Represents "UMN>=LMN" single cell. Holds either "true", "false" or "n/a"

        

func calculateResultEscorial() -> String{
    
    // A. Initialize bothUmnLmn array (holds bools). (Calculate number of times when umn and lmn are both true, number of times when umn is true, and number of times lmn is true.)
    
    for i in 0..<row {
        if(umnSwitchStates[i] == true && lmnSwitchStates[i] == true){
            bothUmnLmn[i] = true
        } else{ bothUmnLmn[i] = false }
    }

    // B. Initialize greaterUmn array (holds bools).

    for i in 0..<row {
        if(umnSwitchStates[i] == true && lmnSwitchStates[i] == true || umnSwitchStates[i] == true && lmnSwitchStates[i] == false){
            greaterUmn[i] = true
        } else{ greaterUmn[i] = false }
    }

    // C. Initialize greaterUmnBlank array (holds ints.
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



    // D. Find the first non-blank value (either 'true' or 'false') and returns it as the UMN>=LMN state. If they are all blank values, "n/a" is the UMN>=LMN state.

    for i in 0..<row {
        if(greaterUmnBlank[i] != 2){
            if(greaterUmnBlank[i] == 0){
                boolFound = "false"
            }
            else{
                boolFound = "true"
            }
        }
    }
    
    return boolFound
}


/*********************************************** Algorithms *********************************************/

func getResultEscorial(boolFound: String) -> String{
    // 1. DETERMINE IF RESULT IS "DEFINITE":
    
    //=IF( OR(AND($J$3=TRUE,$J$4=TRUE,$J$5=TRUE),AND($K$2=TRUE,$L$2=TRUE,$K$7>1,$L$7>1) ), "Definite", "")
    if(bothUmnLmn[1] == true && bothUmnLmn[2] == true && bothUmnLmn[3] == true || umnSwitchStates[0] == true && lmnSwitchStates[0] == true && umnNoBulbRegion > 1 && lmnNoBulbRegion > 1){
        
        finalResultEscorial = 1
        return "Definite"
    }
    
    //2. DETERMINE IF RESULT IS "PROBABLE":
    
    //=IF(AND($K$6>1,$L$6>1,$J$8="",$O$8=TRUE,$B$7=TRUE),"Probable", "")
    if(umnRegion > 1 && lmnRegion > 1 && finalResultEscorial == 0 && boolFound == "true" && umnSignRostral == true){
        finalResultEscorial = 1
        return "Probable"
    }
    
    //3. DETERMINE IF RESULT IS "POSSIBLE":
    
    //=IF(      AND(    OR($J$6>=1,$K$6>=2),J$8="",J$9=""   )         ,"Possible", ""    )
    if(umnLmnRegion >= 1 && finalResultEscorial == 0 || umnRegion >= 2 && finalResultEscorial == 0){
        finalResultEscorial = 1
        return "Possible"
    }
    
    //4. DETERMINE IF RESULT IS "SUSPECTED":
    
    //=IF(AND(L$6>=2,J$8="",J$9="",J$10=""),"Suspected", "")
    if(lmnRegion >= 2 && finalResultEscorial == 0){
        finalResultEscorial = 1
        return "Suspected"
    }
    
    else{return "Possible"}
    
}

