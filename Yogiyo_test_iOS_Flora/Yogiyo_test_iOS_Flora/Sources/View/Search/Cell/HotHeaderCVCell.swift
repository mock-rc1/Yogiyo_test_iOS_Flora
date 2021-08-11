//
//  HotHeaderCVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/11.
//

import UIKit

class HotHeaderCVCell: UICollectionViewCell {
    
    static let identifier = "HotHeaderCVCell"

    @IBOutlet weak var hotsearchCV: UICollectionView!
    
    static func nib() -> UINib {
        return UINib(nibName: "HotHeaderCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
