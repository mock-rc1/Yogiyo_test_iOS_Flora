//
//  ExpressCVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/04.
//

import UIKit

class ExpressCVCell: UICollectionViewCell {
    
    @IBOutlet weak var expressTimeLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var starScoreBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "ExpressCVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageView.layer.cornerRadius = 15
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ExpressCVCell", bundle: nil)
    }

}
