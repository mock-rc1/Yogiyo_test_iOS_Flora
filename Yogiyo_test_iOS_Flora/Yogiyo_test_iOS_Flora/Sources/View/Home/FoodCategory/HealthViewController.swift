//
//  HealthViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/06.
//

import UIKit
import XLPagerTabStrip
import SDWebImage

class HealthViewController: UIViewController, IndicatorInfoProvider {

    lazy var dataManager: CategoryStoreDataManager15 = CategoryStoreDataManager15()

    var categoryStore : [CategoryStoreResult] = []
    
    @IBOutlet weak var chickenTableView: UITableView!
    
    var sections = [1]
    
        override func viewDidLoad() {
            super.viewDidLoad()

            setDelegate()
            setStyle()
            
            self.chickenTableView.register(MyStoreTableViewCell.nib(), forCellReuseIdentifier: MyStoreTableViewCell.identifier)
            
            chickenTableView.separatorColor = UIColor.clear
            
                    //AllTableView.tableFooterView = UIView(frame: .zero)
            chickenTableView.sectionFooterHeight = 0
            
            dataManager.getCategoryStore15(delegate: self)
        }
        

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "헬스/뷰티")
        }
    
    func setDelegate() {
        chickenTableView.delegate = self
        chickenTableView.dataSource = self
    }
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        chickenTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }

    }


extension HealthViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return categoryStore.count
        }
        else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyStoreTableViewCell.identifier) as? MyStoreTableViewCell else{
                return UITableViewCell()
            }

            let store = categoryStore[indexPath.row]
            cell.arrivalTimeLabel.text = store.deliveryTime
            cell.deliveryFeeLabel.text = store.deliveryTip
        cell.foodImageView.sd_setImage(with: URL(string: store.storeLogoURL ))

//            let categoryUrl = URL(string: cate.storeImageURL!)
//            // Fetch Image Data
//            if let data = try? Data(contentsOf: categoryUrl!) {
//                 //Create Image and Update Image View
//                cell.foodImageView.image = UIImage(data: data)
//            }

            cell.starScore.text = store.storeRating
            cell.storeNameLabel.text = store.storeName
            return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 130
    }

    // 섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            let headerView = UIView()
            headerView.backgroundColor = .white
            headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)

            let titleLabel = UILabel()
            titleLabel.textColor = .black
            titleLabel.text = "우리동네 플러스"
            titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            titleLabel.frame = CGRect(x: 20, y: 15, width: headerView.frame.width, height: headerView.frame.height)
            headerView.addSubview(titleLabel)

            return headerView
        }
        return UIView()
    }

    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {

            // 해당 셀을 누르면 'VC' 호출
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: restaurantViewController.self)).instantiateViewController(withIdentifier: "restaurantViewController") as! restaurantViewController


        self.present(storyboardVC, animated: true, completion: nil)
        //self.navigationController?.pushViewController(storyboardVC, animated: true)

        }
}


extension HealthViewController {
    func didSuccessCategoryStore(result: [CategoryStoreResult]) {
        //self.dismissIndicator()
        categoryStore = result
        chickenTableView.reloadData()

    }

    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
