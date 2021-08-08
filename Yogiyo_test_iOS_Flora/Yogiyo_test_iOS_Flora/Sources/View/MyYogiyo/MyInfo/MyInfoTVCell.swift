//
//  MyInfoTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/08.
//

import UIKit

class MyInfoTVCell: UITableViewCell {
    
    static let identifier = "MyInfoTVCell"
    
    @IBOutlet weak var myInfoLabel: UILabel!
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var changeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        changeBtn.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        changeBtn.layer.borderWidth = 0.5
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyInfoTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
