//
//  BannerTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/04.
//

import UIKit

class BannerTVCell: UITableViewCell {
    
    static let identifier = "BannerTVCell"
    
    var testData = [1,2,3,4,5,6,7,8,9,10]
    var minItemSpacing: CGFloat = 10

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControllBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setRegister()
        setDelegate()
        setStyle()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BannerTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRegister() {
        self.bannerCollectionView.register(BannerCVCell.nib(), forCellWithReuseIdentifier: BannerCVCell.identifier)
    }
    
    func setStyle() {
        pageControllBtn.layer.cornerRadius = 10
        self.bannerCollectionView.contentInsetAdjustmentBehavior = .never
        self.bannerCollectionView.decelerationRate = .fast // 감속도를 결정하는 부동소수점 값
    }
    
    func setDelegate() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
    }
    
}

extension BannerTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCVCell.identifier, for: indexPath) as? BannerCVCell else{
            return UICollectionViewCell()
        }
        return cell
    }
}


extension BannerTVCell: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width-40, height: collectionView.frame.height-30)
        
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
    //
    //MARK: - Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let cellWidthIncludeSpacing = (self.bannerCollectionView.frame.width)-40 + minItemSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
