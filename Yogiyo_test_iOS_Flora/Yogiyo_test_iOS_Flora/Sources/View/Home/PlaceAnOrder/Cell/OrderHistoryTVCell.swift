//
//  OrderHistoryTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class OrderHistoryTVCell: UITableViewCell {
    
    var foodOrder = [1,2]
    @IBOutlet weak var tableViewInTableView: UITableView!
    
    static let identifier = "OrderHistoryTVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tableViewInTableView.delegate = self
        tableViewInTableView.dataSource = self
        tableViewInTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        self.tableViewInTableView.register(UINib(nibName: "OrderHistoryInTVCell", bundle: nil),
                                   forCellReuseIdentifier: "OrderHistoryInTVCell")
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "OrderHistoryTVCell", bundle: nil)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension OrderHistoryTVCell : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderHistoryInTVCell.identifier) as? OrderHistoryInTVCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
}
