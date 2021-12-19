//
//  ViewController.swift
//  testVerbesserung
//
//  Created by BHITM09 on 19.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var streetNrTF: UITextField!
    @IBOutlet weak var StreetTF: UITextField!
    @IBOutlet weak var postTf: UITextField!
    @IBOutlet weak var placeTF: UITextField!
    
    var eingabe = Eingabe()
    
    @IBOutlet weak var speichernBtn: UIButton!
    
    @IBAction func firstNameChangedEditing(_ sender: Any) {
        eingabe.firstname = firstNameTF.text ?? ""
        validateWeiter()
    }
    @IBAction func lastNameChangedEditing(_ sender: Any) {
        eingabe.lastname = lastNameTF.text ?? ""
        validateWeiter()
    }
    
    @IBAction func streetChangedEditing(_ sender: Any) {
        eingabe.street = StreetTF.text ?? ""
        validateWeiter()
    }
    
    @IBAction func streetNrChangedEditing(_ sender: Any) {
        eingabe.streetNr = streetNrTF.text ?? ""
        validateWeiter()
    }
    
    @IBAction func postChangedEditing(_ sender: Any) {
        eingabe.postNr = postTf.text ?? ""
            validateWeiter()
    }
    
    @IBAction func placeChangedEditing(_ sender: Any) {
        eingabe.place = placeTF.text ?? ""
        validateWeiter()
    }
    
    func validateWeiter(){
        eingabe.printAll()
        speichernBtn.isEnabled = eingabe.validateEingabe()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speichernBtn.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showResult"){
            print("recognized sequence")
            if let viewController = segue.destination as? ViewControllerResults{
                viewController.eingabe = eingabe
                //viewController.showEingaben()
            }
        }
    }

}

