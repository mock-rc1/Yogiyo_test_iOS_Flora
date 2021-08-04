//
//  BannerCVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/04.
//

import UIKit

class BannerCVCell: UICollectionViewCell {
    
    static let identifier = "BannerCVCell"

    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bannerImageView.layer.cornerRadius = 20
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BannerCVCell", bundle: nil)
    }

}
