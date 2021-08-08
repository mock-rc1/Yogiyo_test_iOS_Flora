//
//  CompleteLoginVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/03.
//

import UIKit

class CompleteLoginVC: UIViewController {
    
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture()
        print("CompleteLoginVC ViewDidLoad 호출 됐음!")
        userNameLabel.text = UserDefaults.standard.string(forKey: "userId")
    }
    
    // MARK: UIView tap gesture
        func tapGesture() {
            let tapGesture = UITapGestureRecognizer(target: self, action:#selector(self.screenDidTap(_:)))
            self.userNameView.addGestureRecognizer(tapGesture)
        }
        @objc private func screenDidTap(_ gesture: UITapGestureRecognizer) {
            let storyboardVC = UIStoryboard(name: "MyYogiyoStoryboard", bundle: Bundle(for: MyInfoViewController.self)).instantiateViewController(withIdentifier: "MyInfoViewController") as! MyInfoViewController
            
            self.navigationController?.pushViewController(storyboardVC, animated: true)
        }
}

