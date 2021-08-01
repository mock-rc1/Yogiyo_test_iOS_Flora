//
//  EmailPassTableViewCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/01.
//

import UIKit

class EmailPassTableViewCell: UITableViewCell {

    @IBOutlet weak var addressName: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    static let identifier = "EmailPassTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "EmailPassTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

