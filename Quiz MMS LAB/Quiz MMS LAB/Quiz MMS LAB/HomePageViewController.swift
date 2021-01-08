//
//  HomePageViewController.swift
//  Quiz MMS LAB
//
//  Created by brandon on 17/10/20.
//

import UIKit

struct dataArrayNOV
{
    var ImageOUT : String
    var NovelOUT : String
    var PriceOUT : String
    //var countOUT : String
}

var dataArrayNovel : [dataArrayNOV] = []
var dataArrayUser : [dataUS] = []

class HomePageViewController: UIViewController {
    var nameGET : String?
    var emailGET : String?
    var genderGET : String?
    var dateGET : String?
    var monthGET : String?
    var yearGET : String?
    
    var step1 : String? = "0"
    var step2 : String? = "0"
    var step3 : String? = "0"
    
    @IBOutlet weak var stepperIN: UIStepper!
    @IBOutlet weak var stepperIN2: UIStepper!
    @IBOutlet weak var stepperIN3: UIStepper!
    
    @IBOutlet weak var StepCounter1: UILabel!
    @IBOutlet weak var StepCounter2: UILabel!
    @IBOutlet weak var StepCounter3: UILabel!
    
    @IBOutlet weak var titleIN: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepperIN.minimumValue = 0
        stepperIN2.minimumValue = 0
        stepperIN3.minimumValue = 0
        // Do any additional setup after loading the view.
        titleIN.text = "Welcome, \(nameGET!)"
    }
    @IBAction func unwindToHomeP(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        if let homesrc = unwindSegue.source as? CheckoutPageViewController
        {
            
        }
    }
    @IBAction func stepperChange(_ sender: UIStepper) {
        step1 = Int(sender.value).description
        StepCounter1.text = step1
        //titleIN.text = step1
        //datadest.countVar = dataArrayNovel[0].countOUT
    }
    @IBAction func stepperChange2(_ sender: UIStepper) {
        step2 = Int(sender.value).description
        StepCounter2.text = step2
        //datadest.countVar = dataArrayNovel[1].countOUT
    }
    @IBAction func stepperChange3(_ sender: UIStepper) {
        step3 = Int(sender.value).description
        StepCounter3.text = step3
        //datadest.countVar = dataArrayNovel[2].countOUT
    }

    @IBAction func LogoutBtn(_ sender: Any) {
        //performSegue(withIdentifier: "goHomeSegue1", sender: nil)
        //button for unwind segue
    }
    
    @IBAction func BuyBtn(_ sender: Any) {
        if (step1 == "0" && step2 == "0" && step3 == "0")
        {
            makealert(almessage: "Select at least 1 item !")
            //makealert(almessage: step1!)
        }
        else
        {
            //go to checkout page
            performSegue(withIdentifier: "goCheckoutSegue3", sender: nil)
        }
    }
    
    func makealert (almessage : String)
    {
        let malert = UIAlertController(title: "Error Alert", message: almessage, preferredStyle: .alert)
        
        let okalert = UIAlertAction(title: "OK", style: .default, handler: nil)
        malert.addAction(okalert)
        present(malert, animated: true, completion: nil)
    }
    
    @IBAction func ProfileBtn(_ sender: Any) {
        //go to profile page
        performSegue(withIdentifier: "goProfileSegue2", sender: nil)
    }
    
    func fetchDataArray ()
    {
        dataArrayNovel.append(dataArrayNOV(ImageOUT: "Dracula", NovelOUT: "Dracula", PriceOUT: "10000"))
        dataArrayNovel.append(dataArrayNOV(ImageOUT: "Divergent", NovelOUT: "Divergent", PriceOUT: "20000"))
        dataArrayNovel.append(dataArrayNOV(ImageOUT: "Happiness", NovelOUT: "Happiness", PriceOUT: "30000"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        fetchDataArray()
        
        //let datadest = segue.destination as! HomeViewController
        if (segue.identifier == "Novelseg1")
        {
            let datadest = segue.destination as! HomeViewController
            datadest.imageVar = dataArrayNovel[0].ImageOUT
            datadest.nameVar = dataArrayNovel[0].NovelOUT
            datadest.priceVar = dataArrayNovel[0].PriceOUT
            //datadest.countVar = dataArrayNovel[0].countOUT
        }
        else if (segue.identifier == "Novelseg2")
        {
            let datadest = segue.destination as! HomeViewController
            datadest.imageVar = dataArrayNovel[1].ImageOUT
            datadest.nameVar = dataArrayNovel[1].NovelOUT
            datadest.priceVar = dataArrayNovel[1].PriceOUT
            //datadest.countVar = dataArrayNovel[1].countOUT
        }
        else if (segue.identifier == "Novelseg3")
        {
            let datadest = segue.destination as! HomeViewController
            datadest.imageVar = dataArrayNovel[2].ImageOUT
            datadest.nameVar = dataArrayNovel[2].NovelOUT
            datadest.priceVar = dataArrayNovel[2].PriceOUT
            //datadest.countVar = dataArrayNovel[2].countOUT
        }
        else if (segue.identifier == "goProfileSegue2")
        {
            //data to profile page
            let prodest = segue.destination as! ProfilePageViewController
            prodest.UserVarGET = nameGET
            prodest.DateVarGET = dateGET
            prodest.MonthVarGET = monthGET
            prodest.YearVarGET = yearGET
            prodest.GenderVarGET = genderGET
            prodest.EmailVarGET = emailGET
        }
        else if (segue.identifier == "goCheckoutSegue3")
        {
            //data to checkout page
            let checkdest = segue.destination as! CheckoutPageViewController
            checkdest.QuantGET1 = step1
            checkdest.QuantGET2 = step2
            checkdest.QuantGET3 = step3
            
            checkdest.NovelNameGET1 = dataArrayNovel[0].NovelOUT
            checkdest.NovelNameGET2 = dataArrayNovel[1].NovelOUT
            checkdest.NovelNameGET3 = dataArrayNovel[2].NovelOUT
            
            checkdest.PriceGET1 =  dataArrayNovel[0].PriceOUT
            checkdest.PriceGET2 =  dataArrayNovel[1].PriceOUT
            checkdest.PriceGET3 =  dataArrayNovel[2].PriceOUT
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
