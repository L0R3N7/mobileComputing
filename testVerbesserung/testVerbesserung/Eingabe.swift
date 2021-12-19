//
//  Eingabe.swift
//  testVerbesserung
//
//  Created by BHITM09 on 19.12.21.
//

import Foundation

class Eingabe{
    var firstname = ""
    var lastname = ""
    var street = ""
    var streetNr = ""
    var place = ""
    var postNr = ""
    
    func validateEingabe() -> Bool {
        return validateString(string: lastname, anzahl: 2, option: 2)
            && validateString(string: postNr, anzahl: 4, option: 1)
            && validateString(string: place, anzahl: 2, option: 2)
    }
    
    func printAll(){
        print(firstname)
        print(lastname)
        print(street)
        print(streetNr)
        print(place)
        print(postNr)
    }
    
    
    func validateString(string : String, anzahl : Int, option : Int) -> Bool{
        switch option {
        case 1:
            return string.count == anzahl
        case 2:
            return string.count >= anzahl
        default:
            return false
        }
    }
    
    
}
