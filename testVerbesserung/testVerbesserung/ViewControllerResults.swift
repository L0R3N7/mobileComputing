//
//  ViewControllerResults.swift
//  testVerbesserung
//
//  Created by BHITM09 on 19.12.21.
//

import UIKit

class ViewControllerResults: UIViewController {
    
    var eingabe = Eingabe()
    
    @IBOutlet weak var firstNameOutput: UILabel!
    @IBOutlet weak var lastNameOutput: UILabel!
    @IBOutlet weak var streetOutput: UILabel!
    @IBOutlet weak var placeOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showEingaben()

        // Do any additional setup after loading the view.
    }
    
    func showEingaben(){
        firstNameOutput.text = eingabe.firstname
        lastNameOutput.text = eingabe.lastname
        streetOutput.text = "\(eingabe.street ) \(eingabe.streetNr)"
        placeOutput.text = "\(eingabe.postNr ) \(eingabe.place)"
    }
    

}
