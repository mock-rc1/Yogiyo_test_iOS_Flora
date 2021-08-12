//
//  HotOurStoreTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/05.
//

import UIKit

// 익스프레스 컬렉션뷰 셀 재사용할거임
class HotOurStoreTVCell: UITableViewCell {
 
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var titleName: UILabel!
    
    static let identifier = "HotOurStoreTVCell"
    
    @IBOutlet weak var HotOurStoreCollectionView: UICollectionView!
    var testData = [1,2,3,4]
    var minItemSpacing: CGFloat = 10

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        HotOurStoreCollectionView.delegate = self
        HotOurStoreCollectionView.dataSource = self
        setRegister()
    }
    
    
    func setRegister() {
        self.HotOurStoreCollectionView.register(ExpressCVCell.nib(), forCellWithReuseIdentifier: ExpressCVCell.identifier)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HotOurStoreTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HotOurStoreTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpressCVCell.identifier, for: indexPath) as? ExpressCVCell else{
            return UICollectionViewCell()
        }
        if indexPath.row == 0 {
                   cell.titleLabel.text = "롯데리아-신촌점"
                   cell.starScoreBtn.setTitle("4.6", for: .normal)
                   cell.reviewLabel.text = "(5,215)"
                   cell.expressTimeLabel.text = "65~75분"
                   cell.imageView.image = UIImage(named: "음식1")
               }
               else if indexPath.row == 1 {
                   cell.titleLabel.text = "혼밥대왕-홍대점"
                   cell.starScoreBtn.setTitle("4.8", for: .normal)
                   cell.reviewLabel.text = "(1,730)"
                   cell.expressTimeLabel.text = "45~55분"
                   cell.imageView.image = UIImage(named: "음식2")
               }
               else if indexPath.row == 2 {
                   cell.titleLabel.text = "가화만사성"
                   cell.starScoreBtn.setTitle("4.6", for: .normal)
                   cell.reviewLabel.text = "(14,620)"
                   cell.expressTimeLabel.text = "20~30분"
                   cell.imageView.image = UIImage(named: "음식3")
               }
               else if indexPath.row == 3 {
                   cell.titleLabel.text = "신연경-본점"
                   cell.starScoreBtn.setTitle("4.5", for: .normal)
                   cell.reviewLabel.text = "(4,083)"
                   cell.expressTimeLabel.text = "30~40분"
                   cell.imageView.image = UIImage(named: "음식4")
               }
               
        return cell
    }
}


extension HotOurStoreTVCell: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width-250, height: collectionView.frame.height-30)
        
    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }

}
