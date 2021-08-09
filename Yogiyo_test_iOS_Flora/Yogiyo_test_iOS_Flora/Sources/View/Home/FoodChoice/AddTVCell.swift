//
//  AddTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/09.
//

import UIKit

class AddTVCell: UITableViewCell {
    
    static let identifier = "AddTVCell"
    
    @IBOutlet weak var checkBoxBtn: UIButton!
    @IBOutlet weak var addCostLabel: UILabel!
    @IBOutlet weak var addFoodLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
