//
//  CategoryFoodConVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/04.
//

import UIKit

class CategoryFoodConVC: UIViewController {

    var hashTag = ["#냉면","#갈비탕","#아이스크림","#밥","#식혜","#과자","#음료수"]
    @IBOutlet weak var hashTagCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setRegister()
    }
    
    
    func setRegister() {
        hashTagCollectionView.register(UINib(nibName: "HashTageCVCell", bundle: nil), forCellWithReuseIdentifier: "HashTageCVCell")
    }
    
    func setDelegate() {
        hashTagCollectionView.delegate = self
        hashTagCollectionView.dataSource = self
    }

}

extension CategoryFoodConVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hashTag.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HashTageCVCell.identifier, for: indexPath) as? HashTageCVCell else{
            return UICollectionViewCell()
        }
        cell.hashTagBtn.setTitle(hashTag[indexPath.row], for: .normal)
        return cell
    }
    
    
}

extension CategoryFoodConVC: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width-250, height: collectionView.frame.height)

    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
}