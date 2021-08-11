//
//  PackCVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/11.
//

import UIKit

class PackCVCell: UICollectionViewCell {
    
    @IBOutlet weak var packBannerImageView: UIImageView!
    
    static let identifier = "PackCVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PackCVCell", bundle: nil)
    }

}
