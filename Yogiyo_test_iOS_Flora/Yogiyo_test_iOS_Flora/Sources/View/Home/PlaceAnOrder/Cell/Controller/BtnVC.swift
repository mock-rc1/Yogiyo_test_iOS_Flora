//
//  BtnVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class BtnVC: UIViewController {

    @IBOutlet weak var btnbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnTap(_ sender: UIButton) {
       
                let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: HomeViewController.self)).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController

        self.dismiss(animated: true){


            self.navigationController?.pushViewController(storyboardVC, animated: true)}

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
