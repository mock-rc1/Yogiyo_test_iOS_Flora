//
//  SearchViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class SearchViewController: UIViewController {
    
    static let identifier = "SearchViewController"
    
    var sections = [1,2]
    var hotSearch = ["1","2","3","4","5","6","7","8","9","10"]
    //var minItemSpacing: CGFloat = 10
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRegister()
        setDelegate()
        
    }
    
    func setRegister() {
        self.mainCollectionView.register(HotHeaderCVCell.nib(), forCellWithReuseIdentifier: HotHeaderCVCell.identifier)
    }
    
    func setDelegate() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return hotSearch.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSearchCVCell.identifier, for: indexPath) as? HotSearchCVCell else{
            return UICollectionViewCell()
        }
        cell.scoreLabel.text = hotSearch[indexPath.row]
        return cell
    }
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width-40)/2, height: 50 )
        
    }
    
    //MARK: - Cell간의 좌우간격 지정
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    //    {
    //        return 10
    //    }
    
    //MARK: - 마진
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    //    {
    //        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    //    }
    //
    //    //MARK: - Paging Effect
    //    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    //    {
    //        let cellWidthIncludeSpacing = (self.mainCollectionView.frame.width)-40 + minItemSpacing
    //        var offset = targetContentOffset.pointee
    //        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
    //        let roundedIndex: CGFloat = round(index)
    //
    //        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
    //        targetContentOffset.pointee = offset
    //    }
}

