//
//  CurrentLocationTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/05.
//

import UIKit

// 아무것도 없을 때 셀이랑 있을 때 셀 바꿔주기위해 셀 두개 만들거야
class CurrentLocationTVCell: UITableViewCell {
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var subAddress: UILabel!
    
    static let identifier = "CurrentLocationTVCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CurrentLocationTVCell", bundle: nil)
    }
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

        
    }
    
}

