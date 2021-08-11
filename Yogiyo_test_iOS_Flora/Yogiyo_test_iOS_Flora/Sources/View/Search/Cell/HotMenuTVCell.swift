//
//  HotMenuTVCell.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import UIKit

class HotMenuTVCell: UITableViewCell {
    
    static let identifier = "HotMenuTVCell"

    var testData = [1,2,3,4,5,6,7,8,9,10]
    
    @IBOutlet weak var HotMenuCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setRegister()
        setDelegate()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HotMenuTVCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRegister() {
        self.HotMenuCollectionView.register(HotMenuCVCell.nib(), forCellWithReuseIdentifier: HotMenuCVCell.identifier)
    }
    

    func setDelegate() {
        HotMenuCollectionView.delegate = self
        HotMenuCollectionView.dataSource = self
    }
    
}

extension HotMenuTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotMenuCVCell.identifier, for: indexPath) as? HotMenuCVCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
}


extension HotMenuTVCell: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width+172)/3, height: collectionView.frame.height/6 )
        
    }
    
  
}
