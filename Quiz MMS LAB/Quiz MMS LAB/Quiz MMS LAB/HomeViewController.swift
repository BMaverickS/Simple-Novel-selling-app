//
//  HomeViewController.swift
//  Quiz MMS LAB
//
//  Created by brandon on 17/10/20.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var NovelImageIN: UIImageView!
    @IBOutlet weak var NovelNameIN: UILabel!
    @IBOutlet weak var NovelPriceIN: UILabel!
    //@IBOutlet weak var NovelCountIN: UILabel!
    
    var imageVar : String?
    var nameVar : String?
    var priceVar : String?
    //var countVar : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NovelImageIN.image = UIImage(named: imageVar!)
        NovelNameIN.text = "\(nameVar!)"
        NovelPriceIN.text = "Rp.\(priceVar!)"
        /*NovelCountIN.text = "\(countVar as! String)"*/
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
