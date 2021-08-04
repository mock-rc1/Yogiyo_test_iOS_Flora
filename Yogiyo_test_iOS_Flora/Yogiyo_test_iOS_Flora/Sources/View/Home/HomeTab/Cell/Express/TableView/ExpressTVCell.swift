//
//  ExpressTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/04.
//

import UIKit

class ExpressTVCell: UITableViewCell {
    
    @IBOutlet weak var YogiyoLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var ExpressCollectionView: UICollectionView!
    
    var testData = [1,2,3,4,5,6,7,8,9,10]
    var minItemSpacing: CGFloat = 10
    
    static let identifier = "ExpressTVCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ExpressCollectionView.delegate = self
        ExpressCollectionView.dataSource = self
        setRegister()
    }
    
    func setRegister() {
        self.ExpressCollectionView.register(ExpressCVCell.nib(), forCellWithReuseIdentifier: ExpressCVCell.identifier)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ExpressTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ExpressTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpressCVCell.identifier, for: indexPath) as? ExpressCVCell else{
            return UICollectionViewCell()
        }
        return cell
    }
}


extension ExpressTVCell: UICollectionViewDelegateFlowLayout{
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
