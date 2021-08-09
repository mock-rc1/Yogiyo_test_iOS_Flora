//
//  SelectTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/09.
//

import UIKit

class SelectTVCell: UITableViewCell {
    
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var selectNameLabel: UILabel!
    @IBOutlet weak var circleBtn: UIButton!
    static let identifier = "SelectTVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
