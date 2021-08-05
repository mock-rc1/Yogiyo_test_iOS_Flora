//
//  MiddleBannerCVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/05.
//

import UIKit

class MiddleBannerCVCell: UICollectionViewCell {
    
    @IBOutlet weak var middleBannerImageView: UIImageView!
    
    static let identifier = "MiddleBannerCVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MiddleBannerCVCell", bundle: nil)
    }

}
