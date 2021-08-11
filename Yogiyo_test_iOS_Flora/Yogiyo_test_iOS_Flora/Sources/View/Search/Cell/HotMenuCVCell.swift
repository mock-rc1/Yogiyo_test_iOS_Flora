//
//  HotMenuCVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import UIKit

class HotMenuCVCell: UICollectionViewCell {
    
    static let identifier = "HotMenuCVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HotMenuCVCell", bundle: nil)
    }

}
