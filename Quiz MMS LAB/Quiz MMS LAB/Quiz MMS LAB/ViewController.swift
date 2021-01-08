//
//  ViewController.swift
//  Quiz MMS LAB
//
//  Created by brandon on 14/10/20.
//

import UIKit

struct dataUS
{
    var userIN : String
    var emailIN : String
    var passIN : String
    var genderIN : String
    var dateIN : String
    var monthIN : String
    var yearIN : String
}

var dataUser : [dataUS] = []

class ViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var genderText: UISegmentedControl!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var monthText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    var gendervar : Int?
    var letgen : String? = "Male"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goHomeSegue1")
        {
            let homedest = segue.destination as! HomePageViewController
        
            let nameSET = dataUser[0].userIN    //send data to HomePageViewController
            let emailSET = dataUser[0].emailIN
            let genderSET = dataUser[0].genderIN
            let dateSET = dataUser[0].dateIN
            let monthSET = dataUser[0].monthIN
            let yearSET = dataUser[0].yearIN
            homedest.nameGET = nameSET
            homedest.emailGET = emailSET
            homedest.genderGET = genderSET
            homedest.dateGET = dateSET
            homedest.monthGET = monthSET
            homedest.yearGET = yearSET
        }
    }
    
    @IBAction func genderswitch(_ sender: Any) {
        gendervar = genderText.selectedSegmentIndex
    }
        
    @IBAction func RegisterBtn(_ sender: Any) {
        let uslen = userText.text?.count
        let emlen = emailText.text?.count
        let paslen = passText.text?.count
        let emcon = emailText.text?.contains("@")
        let emsuf = emailText.text?.hasSuffix(".com")
        
        if (uslen! < 4 || uslen! > 12)
        {
            givealert(almessage: "Username's length must be between 4 and 12 characters !")
        }
        else if (emlen! == 0)
        {
            givealert(almessage: "Email can not be empty !")
        }
        else if !(emcon! && emsuf!)
        {
            givealert(almessage: "Email must contains '@' and ends with '.com' !")
        }
        else if (paslen! < 4 || paslen! > 12)
        {
            givealert(almessage: "Password's length must be between 4 and 12 characters !")
        }
        else if (dateText.text?.isEmpty == true)
        {
            givealert(almessage: "Date must be filled !")
        }
        else if (monthText.text?.isEmpty == true)
        {
            givealert(almessage: "Month must be filled !")
        }
        else if (yearText.text?.isEmpty == true)
        {
            givealert(almessage: "Year must be filled !")
        }
        else
        {
            //gendervar = genderText.selectedSegmentIndex
            if (gendervar == 0)
            {
                //givealert(almessage: "Male")
                letgen = "Male"
            }
            else if (gendervar == 1)
            {
                //givealert(almessage: "Female")
                letgen = "Female"
            }
            dataUser.append(dataUS(userIN: userText.text!, emailIN: emailText.text!, passIN: passText.text!, genderIN: letgen!, dateIN: dateText.text!, monthIN: monthText.text!, yearIN: yearText.text!))
            performSegue(withIdentifier: "goHomeSegue1", sender: nil)
        }
    }
    
    @IBAction func unwindToRegisterP(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        if let regissrc = unwindSegue.source as? HomePageViewController
        {
            
        }
    }
    
    func givealert (almessage : String)
    {
        let galert = UIAlertController(title: "Error Alert", message: almessage, preferredStyle: .alert)
        
        let okalert = UIAlertAction(title: "OK", style: .default, handler: nil)
        galert.addAction(okalert)
        present(galert, animated: true, completion: nil)
    }
}
