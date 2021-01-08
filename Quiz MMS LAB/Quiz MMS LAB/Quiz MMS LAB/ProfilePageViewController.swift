//
//  ProfilePageViewController.swift
//  Quiz MMS LAB
//
//  Created by brandon on 18/10/20.
//

import UIKit

class ProfilePageViewController: UIViewController {

    @IBOutlet weak var LogoImageIN: UIImageView!
    @IBOutlet weak var LogoUserIN: UILabel!
    @IBOutlet weak var LogoDateIN: UILabel!
    @IBOutlet weak var LogoGenderIN: UILabel!
    @IBOutlet weak var LogoEmailIN: UILabel!
    
    var UserVarGET : String?
    var DateVarGET : String?
    var MonthVarGET : String?
    var YearVarGET : String?
    var GenderVarGET : String?
    var EmailVarGET : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        LogoImageIN.image = UIImage(named: "LogoMyNoveliSK")
        LogoUserIN.text = "\(UserVarGET!)"
        LogoDateIN.text = "\(YearVarGET!) - \(MonthVarGET!) - \(DateVarGET!)"
        LogoGenderIN.text = "\(GenderVarGET!)"
        LogoEmailIN.text = "\(EmailVarGET!)"
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
