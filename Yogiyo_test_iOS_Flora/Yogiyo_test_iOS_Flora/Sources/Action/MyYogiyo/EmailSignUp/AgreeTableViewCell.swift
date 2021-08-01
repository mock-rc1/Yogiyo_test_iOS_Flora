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
    
    var buttonClick = true
 
    static let identifier = "AgreeTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        allAgreeBtn.tag = 1
//        useAgreeBtn.tag = 2
//        privacyAgreeBtn.tag = 3
//        financeAgreeBtn.tag = 4
//        ageAgreeBtn.tag = 5
//        yogiyoAgreeBtn.tag = 6
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "AgreeTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func allAgreeBtnTap (_ sender: UIButton) {
        print("눌린다")

        if (buttonClick == true) {
            allAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            useAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            privacyAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            financeAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            ageAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            yogiyoAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            allAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            useAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            privacyAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            financeAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            ageAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            yogiyoAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        else {
            allAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            useAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            privacyAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            financeAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            ageAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            yogiyoAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            allAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            useAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            privacyAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            financeAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            ageAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            yogiyoAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func useAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            useAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            useAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            useAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            useAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func privacyAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            privacyAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            privacyAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            privacyAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            privacyAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func financeAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            financeAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            financeAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            financeAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            financeAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func ageAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            ageAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            ageAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            ageAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            ageAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func yogiyoAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            yogiyoAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            yogiyoAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            yogiyoAgreeBtn.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            yogiyoAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
}
