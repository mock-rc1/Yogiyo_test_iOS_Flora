//
//  CurrentLocationVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/05.
//

import UIKit

class CurrentLocationVC: UIViewController {

    @IBOutlet weak var locationTableView: UITableView!
    
    var address = [1,2,3]
    var sections = ["최근주소"]
    
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationTableView.delegate = self
        locationTableView.dataSource = self
        setStyle()
        
        self.locationTableView.register(CurrentLocationTVCell.nib(), forCellReuseIdentifier: CurrentLocationTVCell.identifier)
        
        locationTableView.separatorColor = UIColor.clear

    }
    
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        locationTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension CurrentLocationVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return address.count
        }
        else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrentLocationTVCell.identifier) as? CurrentLocationTVCell else{
                return UITableViewCell()
            }
            cell.cancelBtn.addTarget(self, action: #selector(deleteButton(_:)), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 80
    }
    
    // 섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
 
        if section == 0 {
            let headerView = UIView()
            headerView.backgroundColor = .white
            headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
            
            let titleLabel = UILabel()
            titleLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            titleLabel.text = "최근 주소"
            titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            titleLabel.frame = CGRect(x: 20, y: 10, width: headerView.frame.width, height: headerView.frame.height)
            headerView.addSubview(titleLabel)
            
            return headerView
        }

        return UIView()
    }
    
    @objc func deleteButton(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: locationTableView)
            guard let indexPath = locationTableView.indexPathForRow(at: point) else { return }
        address.remove(at: indexPath.row)
        locationTableView.deleteRows(at: [indexPath], with: .automatic)
        }

}
