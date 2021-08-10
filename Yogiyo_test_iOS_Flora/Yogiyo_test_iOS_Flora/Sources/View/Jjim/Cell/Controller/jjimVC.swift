//
//  jjimVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class jjimVC: UIViewController {

    @IBOutlet weak var tastyStoreBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tastyStoreBtn.layer.cornerRadius = 5
        tastyStoreBtn.layer.borderWidth = 0.5
        tastyStoreBtn.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)

    }



}
