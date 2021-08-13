//
//  OrderInfoVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class OrderInfoVC: UIViewController {
    
    let dogBreed = ["단무지/치킨무/반찬류 안주셔도 돼요.", "벨은 누르지 말아주세요", "도착 후 전화주시면 직접 받으러 갈게요", "그냥 문 앞에 놓아주시면 돼요"]
    
    @IBOutlet weak var requestTextField: UITextField!
    @IBOutlet weak var secondview: UIButton!
    @IBOutlet weak var firstview: UIButton!
    @IBOutlet weak var SecondTextField: UITextField!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension PlaceAnOrderVC: UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return dogBreed.count
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return dogBreed[row]
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        requestTextField.text = dogBreed[row]
//       
//    }
//    
//    func createPickerView() {
//        let pickerView = UIPickerView()
//        pickerView.delegate = self
//        requestTextField.inputView = pickerView
//    }
//    
//    func dismissPickerView() {
//        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
//        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action))
//        toolBar.setItems([button], animated: true)
//        toolBar.isUserInteractionEnabled = true
//        requestTextField.inputAccessoryView = toolBar
//    }
//    @objc func action() {
//        requestTextField.resignFirstResponder()
//    }
//}
