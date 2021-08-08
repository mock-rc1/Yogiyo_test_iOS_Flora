//
//  LoginLogoutConVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/08.
//

import UIKit

class LoginLogoutConVC: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logoutBtnTap(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "userId")
        UserDefaults.standard.removeObject(forKey: "userPw")
        UserDefaults.standard.removeObject(forKey: "userToken")
        
        let storyboardVC = UIStoryboard(name: "MyYogiyoStoryboard", bundle: Bundle(for: MyYogiyoViewController.self)).instantiateViewController(withIdentifier: "MyYogiyoViewController") as! MyYogiyoViewController
        //navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
}
