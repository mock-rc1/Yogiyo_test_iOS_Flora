//
//  RecentlyVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class RecentlyVC: UIViewController {

    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var expressImage: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var starScoreLabel: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        storeImage.layer.cornerRadius = 10
        
    }


   

}
