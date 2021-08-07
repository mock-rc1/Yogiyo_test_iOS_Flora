//
//  HashTagVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/07.
//

import UIKit

class HashTagVC: UIViewController {

    @IBOutlet weak var hashTagCollectionView: UICollectionView!
    
    var hashTag = ["요기요랭킹순","익스프레스","배달요금", "할인중","최소주문금액","결제수단 전체"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()

    }
    func setRegister() {
        hashTagCollectionView.register(UINib(nibName: "hashTagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "hashTagCollectionViewCell")
    }
    
    func setDelegate() {
        hashTagCollectionView.delegate = self
        hashTagCollectionView.dataSource = self
    }

}

extension HashTagVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hashTag.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hashTagCollectionViewCell.identifier, for: indexPath) as? hashTagCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.hashTagBtn.setTitle(hashTag[indexPath.row], for: .normal)
        return cell
    }
    
    
}

extension HashTagVC: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width-270, height: collectionView.frame.height)

    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 5
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    
   
    
}
