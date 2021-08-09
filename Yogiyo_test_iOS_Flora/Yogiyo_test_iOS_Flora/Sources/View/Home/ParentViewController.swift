

import UIKit
import XLPagerTabStrip

class ParentViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var hashTagUIView: UIView!
    var hashTagController : HashTagVC?
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setController()
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .black
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 16)
        //settings.style.selectedBarHeight = 0.5
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .systemGray
            newCell?.label.textColor = .black
        }
    }
    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child_1 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child1")
        let child_2 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child2")
        let child_3 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child3")
        
        let child_4 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child4")
        let child_5 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child5")
        let child_6 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child6")
        
        let child_7 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child7")
        let child_8 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child8")
        let child_9 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child9")
        
        let child_10 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child10")
        let child_11 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child11")
        let child_12 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child12")
        
        let child_13 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child13")
        let child_14 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child14")
        let child_15 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child15")
        
        let child_16 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child16")
        let child_17 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "child17")
        
        return [child_1, child_2, child_3, child_4,child_5,child_6,child_7,child_8,child_9,child_10,child_11,child_12,child_13,child_14,child_15,child_16,child_17]
    }
    
    func setController() {
        hashTagController = HashTagVC(nibName: "HashTagVC",
                                          bundle: nil)
        
        // 셀에 컨트롤러의 View를 추가
        hashTagUIView.addSubview(hashTagController!.view)
        
        // 하위 컨트롤러를 상위 컨트롤러에 추가
        self.addChild(hashTagController!)
        
        // autolayout
        hashTagController!.view.translatesAutoresizingMaskIntoConstraints = false
     
        hashTagController!.view.topAnchor.constraint(equalTo: self.hashTagUIView.topAnchor).isActive = true
        hashTagController!.view.bottomAnchor.constraint(equalTo: self.hashTagUIView.bottomAnchor).isActive = true
        hashTagController!.view.leftAnchor.constraint(equalTo: self.hashTagUIView.leftAnchor).isActive = true
        hashTagController!.view.rightAnchor.constraint(equalTo: self.hashTagUIView.rightAnchor).isActive = true
        
        // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
        hashTagController!.didMove(toParent: self)
    }
  
    
}


