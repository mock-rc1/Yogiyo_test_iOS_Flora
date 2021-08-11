//
//  HeaderHotTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import UIKit

class HeaderHotTVCell: UITableViewCell {
    
    static let identifier = "HeaderHotTVCell"

    var testData = [1,2,3,4,5,6,7,8,9,10]
    
    @IBOutlet weak var HotCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setRegister()
        setDelegate()
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderHotTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRegister() {
        self.HotCollectionView.register(HotSearchCVCell.nib(), forCellWithReuseIdentifier: HotSearchCVCell.identifier)
    }
    

    func setDelegate() {
        HotCollectionView.delegate = self
        HotCollectionView.dataSource = self
    }
    
}

extension HeaderHotTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSearchCVCell.identifier, for: indexPath) as? HotSearchCVCell else{
            return UICollectionViewCell()
        }
        return cell
    }
}


extension HeaderHotTVCell: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width+90)/3, height: 45)
        
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
