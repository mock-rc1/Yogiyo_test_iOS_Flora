//
//  hashTagCollectionViewCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/06.
//

import UIKit

class hashTagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var hashTagBtn: UIButton!
    @IBOutlet weak var hashTagUIVIew: UIView!
    
    static let identifier = "hashTagCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "hashTagCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        hashTagUIVIew.layer.cornerRadius = 15
        hashTagUIVIew.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        hashTagUIVIew.layer.borderWidth = 0.5
    }

}
