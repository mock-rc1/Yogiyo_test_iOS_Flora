//
//  TodayYogiTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/08.
//

import UIKit

class TodayYogiTVCell: UITableViewCell {
    
    @IBOutlet weak var imageUIView: UIView!
    
    static let identifier = "TodayYogiTVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageUIView.layer.cornerRadius = 10
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TodayYogiTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}


