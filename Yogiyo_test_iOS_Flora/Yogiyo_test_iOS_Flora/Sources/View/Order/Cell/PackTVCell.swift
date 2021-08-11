//
//  PackTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/11.
//

import UIKit

class PackTVCell: UITableViewCell {
    
    static let identifier = "PackTVCell"
    
    var testData = [1,2]

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var packBannerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setRegister()
        setDelegate()
        setStyle()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PackTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRegister() {
        self.packBannerCollectionView.register(PackCVCell.nib(), forCellWithReuseIdentifier: PackCVCell.identifier)
    }
    
    func setStyle() {
        self.packBannerCollectionView.contentInsetAdjustmentBehavior = .never
        self.packBannerCollectionView.decelerationRate = .fast // 감속도를 결정하는 부동소수점 값
    }
    
    func setDelegate() {
        packBannerCollectionView.delegate = self
        packBannerCollectionView.dataSource = self
    }
    
    // pageControl 초기셋팅
        func pageControlInitLayout() {
            pageControl.numberOfPages = testData.count
            pageControl.currentPageIndicatorTintColor = .white
        }
    
}

extension PackTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PackCVCell.identifier, for: indexPath) as? PackCVCell else{
            return UICollectionViewCell()
        }
        return cell
    }
}


extension PackTVCell: UICollectionViewDelegateFlowLayout{
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
        let cellWidthIncludeSpacing = (self.packBannerCollectionView.frame.width)
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

// MARK:- UIScrollViewDelegate
extension PackTVCell {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
