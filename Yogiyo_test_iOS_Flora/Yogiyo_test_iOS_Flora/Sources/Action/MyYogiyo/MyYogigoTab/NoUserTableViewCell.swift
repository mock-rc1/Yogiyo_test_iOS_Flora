//
//  NoUserTableViewCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/01.
//

import UIKit

class NoUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var loginUIView: UIView!
    
    static let identifier = "NoUserTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        tapGesture()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NoUserTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: UIView tap gesture
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(self.screenDidTap(_:)))
        self.loginUIView.addGestureRecognizer(tapGesture)
    }
    @objc private func screenDidTap(_ gesture: UITapGestureRecognizer) {
//        guard let dvc = storyboard?.instantiateViewController(identifier: "SocialLoginViewController")else{return}
//        present(dvc, animated: true, completion:nil)
     print("tap")
    }
    
}
