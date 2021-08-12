//
//  MiddleBannerTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/05.
//

import UIKit

class MiddleBannerTVCell: UITableViewCell {
    
    static let identifier = "MiddleBannerTVCell"
    
    var testData = [1,2,3,4,5]

    var minItemSpacing: CGFloat = 10
    
    @IBOutlet weak var MiddleBannerCollectionView: UICollectionView!
    @IBOutlet weak var pageControllLabel: UILabel!
    @IBOutlet weak var pageControllView: UIView!
    @IBOutlet weak var pageControll: UIButton!
    static func nib() -> UINib {
        return UINib(nibName: "MiddleBannerTVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        MiddleBannerCollectionView.delegate = self
        MiddleBannerCollectionView.dataSource = self
        
        setRegister()
        setStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRegister() {
        self.MiddleBannerCollectionView.register(MiddleBannerCVCell.nib(), forCellWithReuseIdentifier: MiddleBannerCVCell.identifier)
    }
    
    func setStyle() {
        pageControllView.layer.cornerRadius = 10
        self.MiddleBannerCollectionView.contentInsetAdjustmentBehavior = .never
        self.MiddleBannerCollectionView.decelerationRate = .fast // 감속도를 결정하는 부동소수점 값
        MiddleBannerCollectionView.layer.cornerRadius = 10
    }
    
}

extension MiddleBannerTVCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleBannerCVCell.identifier, for: indexPath) as? MiddleBannerCVCell else{
            return UICollectionViewCell()
        }
        
        if indexPath.row == 0 {
            cell.middleBannerImageView.image = UIImage(named: "할인1")
        }
        else if indexPath.row == 1 {
            cell.middleBannerImageView.image = UIImage(named: "할인2")
        }
        else if indexPath.row == 2 {
            cell.middleBannerImageView.image = UIImage(named: "할인3")
        }
        else if indexPath.row == 3 {
            cell.middleBannerImageView.image = UIImage(named: "할인4")
        }
        else if indexPath.row == 4 {
            cell.middleBannerImageView.image = UIImage(named: "할인5")
        }
        return cell
    }
    
    
}

extension MiddleBannerTVCell: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    //
    //MARK: - Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let cellWidthIncludeSpacing = (self.MiddleBannerCollectionView.frame.width) + minItemSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
