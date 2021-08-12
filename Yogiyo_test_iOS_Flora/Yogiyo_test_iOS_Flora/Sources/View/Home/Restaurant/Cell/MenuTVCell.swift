//
//  MenuTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/11.
//

import UIKit

class MenuTVCell: UITableViewCell {
    
    static let identifier = "MenuTVCell"
    
    var menuIndex : Int?

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        foodImageView.layer.cornerRadius = 10
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MenuTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
