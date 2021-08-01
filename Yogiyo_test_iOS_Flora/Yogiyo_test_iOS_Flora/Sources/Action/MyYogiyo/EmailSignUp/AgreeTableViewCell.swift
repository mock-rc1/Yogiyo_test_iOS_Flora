//
//  AgreeTableViewCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/01.
//

import UIKit

class AgreeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var allAgreeBtn: UIButton!
    @IBOutlet weak var useAgreeBtn: UIButton!
    @IBOutlet weak var privacyAgreeBtn: UIButton!
    @IBOutlet weak var financeAgreeBtn: UIButton!
    @IBOutlet weak var ageAgreeBtn: UIButton!
    @IBOutlet weak var yogiyoAgreeBtn: UIButton!
 
    static let identifier = "AgreeTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        allAgreeBtn.tag = 1
        useAgreeBtn.tag = 2
        privacyAgreeBtn.tag = 3
        financeAgreeBtn.tag = 4
        ageAgreeBtn.tag = 5
        yogiyoAgreeBtn.tag = 6
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "AgreeTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func allAgreeBtnTap (_ sender: UIButton) {
        
        viewWithTag(2)
        viewWithTag(3)
        viewWithTag(4)
        viewWithTag(5)
        viewWithTag(6)

    }
    
}
