//
//  CompleteTableViewCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/01.
//

import UIKit

class CompleteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var completeUIView: UIView!
    
    static let identifier = "CompleteTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        tapGesture()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CompleteTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: UIView tap gesture
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(self.screenDidTap(_:)))
        self.completeUIView.addGestureRecognizer(tapGesture)
    }
    @objc private func screenDidTap(_ gesture: UITapGestureRecognizer) {
        // 페이지 생성할건지 말건지 알게되면 그때 하자
//        guard let dvc = self.storyboard?.instantiateViewController(identifier: "")else{return}
//        self.present(dvc, animated: true, completion:nil)
     print("tap")
    }
    
    
}
