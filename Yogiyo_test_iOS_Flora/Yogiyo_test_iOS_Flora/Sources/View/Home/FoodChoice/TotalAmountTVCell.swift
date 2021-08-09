//
//  TotalAmountTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/09.
//

import UIKit

class TotalAmountTVCell: UITableViewCell {
    
    static let identifier = "TotalAmountTVCell"

    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var minOrderCostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TotalAmountTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
