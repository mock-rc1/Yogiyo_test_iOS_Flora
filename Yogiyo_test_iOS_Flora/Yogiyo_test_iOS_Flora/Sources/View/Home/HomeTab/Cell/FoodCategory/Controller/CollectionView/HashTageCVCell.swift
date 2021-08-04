//
//  HashTageCVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/04.
//

import UIKit

class HashTageCVCell: UICollectionViewCell {
    
    static let identifier = "HashTageCVCell"

    @IBOutlet weak var hashTagBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hashTagBtn.layer.cornerRadius = 20
    }
    
}
