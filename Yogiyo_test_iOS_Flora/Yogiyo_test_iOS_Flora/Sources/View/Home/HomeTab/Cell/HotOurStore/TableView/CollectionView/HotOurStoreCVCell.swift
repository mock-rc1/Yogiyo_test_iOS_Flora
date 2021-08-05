//
//  HotOurStoreCVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/05.
//

import UIKit

class HotOurStoreCVCell: UICollectionViewCell {
    
    static let identifier = "HotOurStoreCVCell"

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var starScoreLabel: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        foodImageView.layer.cornerRadius = 15
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HotOurStoreCVCell", bundle: nil)
    }

}
