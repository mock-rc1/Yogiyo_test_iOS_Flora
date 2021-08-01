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
        print("눌린다")
        
        viewWithTag(1)?.backgroundColor = .red
        viewWithTag(2)?.backgroundColor = .red
        viewWithTag(3)?.backgroundColor = .red
        viewWithTag(4)?.backgroundColor = .red
        viewWithTag(5)?.backgroundColor = .red
        viewWithTag(6)?.backgroundColor = .red
        

    }
    
}
