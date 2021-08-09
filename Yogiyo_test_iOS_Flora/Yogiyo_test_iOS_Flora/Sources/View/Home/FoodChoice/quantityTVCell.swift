//
//  quantityTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/09.
//

import UIKit

class quantityTVCell: UITableViewCell {
    
    @IBOutlet weak var countUIView: UIView!
    @IBOutlet weak var countNumLabel: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    
    static let identifier = "quantityTVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        minusBtn.layer.addBorder([.top, .bottom, .left], color: UIColor.black, width: 0.5)
        countUIView.layer.addBorder([.top, .bottom, .left, .right], color: UIColor.black, width: 0.5)
        plusBtn.layer.addBorder([.top, .bottom, .right], color: UIColor.black, width: 0.5)
    }

    
    static func nib() -> UINib {
        return UINib(nibName: "quantityTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
