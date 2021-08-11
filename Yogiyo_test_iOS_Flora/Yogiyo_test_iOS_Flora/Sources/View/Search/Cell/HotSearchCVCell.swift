//
//  HotSearchCVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/11.
//

import UIKit

class HotSearchCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageBtn: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    static let identifier = "HotSearchCVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HotSearchCVCell", bundle: nil)
    }

}
