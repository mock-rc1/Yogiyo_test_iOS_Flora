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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //locationTableView.delegate = self
        //locationTableView.dataSource = self

    }
    

}

//extension CurrentLocationVC : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return address.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//
//
//}
