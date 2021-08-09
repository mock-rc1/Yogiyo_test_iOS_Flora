//
//  PriceTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/09.
//

import UIKit

class PriceTVCell: UITableViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    static let identifier = "PriceTVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PriceTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
