//
//  CheckoutPageViewController.swift
//  Quiz MMS LAB
//
//  Created by brandon on 18/10/20.
//

import UIKit

class CheckoutPageViewController: UIViewController {

    @IBOutlet weak var NovelNameIN1: UILabel!
    @IBOutlet weak var NovelNameIN2: UILabel!
    @IBOutlet weak var NovelNameIN3: UILabel!
    @IBOutlet weak var NovelTotalIN: UILabel!
    @IBOutlet weak var NovelTQIN: UILabel!
    
    @IBOutlet weak var NovelQIN1: UILabel!
    @IBOutlet weak var NovelQIN2: UILabel!
    @IBOutlet weak var NovelQIN3: UILabel!
    
    var QuantGET1 : String?
    var QuantGET2 : String?
    var QuantGET3 : String?
        
    var NovelNameGET1 : String?
    var NovelNameGET2 : String?
    var NovelNameGET3 : String?
        
    var PriceGET1 : String?
    var PriceGET2 : String?
    var PriceGET3 : String?
    
    var TotalIGET : Int?
    var TotalGET : Int?
    
    var Sub1 : Int?
    var Sub2 : Int?
    var Sub3 : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NovelNameIN1.text = "\(NovelNameGET1!)"
        NovelNameIN2.text = "\(NovelNameGET2!)"
        NovelNameIN3.text = "\(NovelNameGET3!)"
                
        NovelQIN1.text = "\(QuantGET1!) X"
        NovelQIN2.text = "\(QuantGET2!) X"
        NovelQIN3.text = "\(QuantGET3!) X"
               
        //set total item
        TotalIGET = Int(QuantGET1!)! + Int(QuantGET2!)! + Int(QuantGET3!)!
        //count sub total
        Sub1 = Int(QuantGET1!)! * Int(PriceGET1!)!
        Sub2 = Int(QuantGET2!)! * Int(PriceGET2!)!
        Sub3 = Int(QuantGET3!)! * Int(PriceGET3!)!
        //count total price
        TotalGET = Sub1! + Sub2! + Sub3!
        NovelTotalIN.text = "Total \(TotalIGET!) item (s)"
        NovelTQIN.text = "Rp. \(TotalGET!)"
    }
    
    @IBAction func CheckBtn(_ sender: Any) {
        //unwind segue
        //show alert
        showalert(almessage: "Thank you for buying at our shop. Total price is Rp. \(TotalGET!)!")
        //back to home
        
    }
    
    func showalert (almessage : String)
    {
        let salert = UIAlertController(title: "Thank You", message: almessage, preferredStyle: .alert)
            
        let okalert = UIAlertAction(title: "OK", style: .default, handler: { action in self.performSegue(withIdentifier: "unwindToHomeP", sender: nil)})
        //trigger unwind segue after press ok
            salert.addAction(okalert)
            present(salert, animated: true, completion: nil)
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little pre#imageLiteral(resourceName: "simulator_screenshot_E7345566-BD45-4737-B138-A66207986C7E.png")paration before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
