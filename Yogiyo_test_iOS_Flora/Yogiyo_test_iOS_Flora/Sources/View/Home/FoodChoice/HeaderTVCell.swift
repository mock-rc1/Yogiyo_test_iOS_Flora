//
//  HeaderTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/09.
//

import UIKit

class HeaderTVCell: UITableViewCell {
    
    static let identifier = "HeaderTVCell"

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var subFoodNameLabel: UILabel!
    @IBOutlet weak var reviewBtnView: UIView!
    @IBOutlet weak var reviewScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reviewBtnView.layer.cornerRadius = 20
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
