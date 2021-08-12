//
//  CategoryFoodConVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/04.
//

import UIKit
import XLPagerTabStrip

class CategoryFoodConVC: UIViewController {

    @IBOutlet weak var allFoodBtn: UIButton!
    @IBOutlet weak var ChineseFoodBtn: UIButton!
    @IBOutlet weak var ChickenBtn: UIButton!
    @IBOutlet weak var KoreanFoodBtn: UIButton!
    @IBOutlet weak var BurgerBtn: UIButton!
    @IBOutlet weak var PizzaBtn: UIButton!
    @IBOutlet weak var SoupBtn: UIButton!
    @IBOutlet weak var CafeBtn: UIButton!
    @IBOutlet weak var BunsikBtn: UIButton!
    @IBOutlet weak var SinglePersonBtn: UIButton!
    @IBOutlet weak var JapaneseBtn: UIButton!
    @IBOutlet weak var NightBtn: UIButton!
    @IBOutlet weak var PigBtn: UIButton!
    @IBOutlet weak var FranchiseBtn: UIButton!
    @IBOutlet weak var yomartBtn: UIButton!
    @IBOutlet weak var BeautyBtn: UIButton!
    @IBOutlet weak var PetBtn: UIButton!
    
    
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
    
    @IBAction func allFoodBtnTap(_ sender: Any) {
        
        allFoodBtn.tag = 1
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func ChineseBtnTap(_ sender: Any) {
        
        ChineseFoodBtn.tag = 2
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
        
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func ChickenBtnTap(_ sender: Any) {
        
        ChickenBtn.tag = 3
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func KoreanBtnTap(_ sender: Any) {
        
        KoreanFoodBtn.tag = 4
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func BurgerBtnTap(_ sender: Any) {
        
        BurgerBtn.tag = 5
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func pizzaBtnTap(_ sender: Any) {
        
        PizzaBtn.tag = 6
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func SoupBtnTap(_ sender: Any) {
        
        SoupBtn.tag = 7
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func cafeBtnTap(_ sender: Any) {
        
        CafeBtn.tag = 8
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func bunsikBtnTap(_ sender: Any) {
        
        BunsikBtn.tag = 9
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func singlePersonBtnTap(_ sender: Any) {
        
        SinglePersonBtn.tag = 10
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func JapaneseBtnTap(_ sender: Any) {
        
        JapaneseBtn.tag = 11
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func NightBtnTap(_ sender: Any) {
        
        NightBtn.tag = 12
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func PigBtnTap(_ sender: Any) {
        
        PigBtn.tag = 13
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func FranchiseBtnTap(_ sender: Any) {
        
        FranchiseBtn.tag = 14
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func yomartBtnTap(_ sender: Any) {
        
        yomartBtn.tag = 15
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func beautyBtnTap(_ sender: Any) {
        
        BeautyBtn.tag = 16
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
    }
    
    @IBAction func PetBtnTap(_ sender: Any) {
        
        PetBtn.tag = 17
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: ParentViewController.self)).instantiateViewController(withIdentifier: "ParentViewController") as! ParentViewController
                
        self.navigationController?.pushViewController(storyboardVC, animated: true)
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
