//
//  MyStoreTableViewCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/06.
//

import UIKit

class MyStoreTableViewCell: UITableViewCell {
    
    static let identifier = "MyStoreTableViewCell"

    var storeIndex : Int?
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var experssOrclockLabel: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var starScore: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
        static func nib() -> UINib {
            return UINib(nibName: "MyStoreTableViewCell", bundle: nil)
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        foodImageView.layer.cornerRadius = 5

        // Configure the view for the selected state
    }
    
}
