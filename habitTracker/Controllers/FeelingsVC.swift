//
//  feelingsVC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 21.06.2022.
//

import UIKit

class FeelingsVC: UIViewController {
    
    @IBOutlet weak var btnContinue: UIButton!
    
    
    var flag = false
    var focusTypeList = [HabitViewModel]()
    
    var allFeelings = [FeelingsViewModel(image: UIImage(named: "awful")!, name: "awful", isSelected: false),
                       FeelingsViewModel(image: UIImage(named: "bad")!, name: "bad", isSelected: false),
                       FeelingsViewModel(image: UIImage(named: "happy")!, name: "happy", isSelected: false),
                       FeelingsViewModel(image: UIImage(named:"okay")!, name: "okay", isSelected: false),
                       FeelingsViewModel(image: UIImage(named: "sad")!, name: "sad", isSelected: false),
                       FeelingsViewModel(image: UIImage(named: "sick")!, name: "sick", isSelected: false),
                       FeelingsViewModel(image: UIImage(named: "unsure")!, name: "unsure", isSelected: false)
    ]
    

    @IBOutlet weak var collectionViewFeelings: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnContinue.isEnabled = false
        collectionViewFeelings.dataSource = self
        collectionViewFeelings.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnContinueAct(_ sender: UIButton) {
        
        
        
    }
    

}

extension FeelingsVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFeelings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! feelingsCVC
        
        cell.feelingImgView.image = allFeelings[indexPath.row].image
        cell.feelingImgView.layer.borderWidth = 5
        cell.feelingImgView.layer.borderColor = UIColor(named: "purple")!.cgColor
        cell.feelingImgView.layer.masksToBounds = true
        cell.feelingImgView.layer.cornerRadius = 30
        cell.feelingImgView.layer.shadowRadius = 50
        cell.feelingImgView.layer.shadowOpacity = 4
        cell.feelingImgView.layer.shadowColor = UIColor(named: "pink")!.cgColor
        
        
        cell.feelingLbl.text = allFeelings[indexPath.row].name
        
        let cellBorder: UIColor = (allFeelings[indexPath.row].isSelected == true) ? .white : UIColor(named: "purple")!
        let cellLblcolor: UIColor = (allFeelings[indexPath.row].isSelected == true) ? UIColor(named: "purple")! : UIColor(named: "purple")!
        
        
        cell.feelingImgView.layer.borderColor = cellBorder.cgColor
        cell.feelingLbl.textColor = cellLblcolor
        
        
        if allFeelings[indexPath.row].isSelected {
            btnContinue.isEnabled = true
            btnContinue.layer.borderWidth = 3
            btnContinue.layer.borderColor = UIColor.white.cgColor
            btnContinue.tintColor = .white
            btnContinue.backgroundColor = UIColor(named: "purple")!
            
        } else {
            btnContinue.isEnabled = false
            btnContinue.layer.borderWidth = 3
            btnContinue.layer.borderColor = UIColor(named: "purple")!.cgColor
            btnContinue.tintColor = UIColor(named: "purple")!
            btnContinue.backgroundColor = UIColor.white
        }

        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let spaceBetweenCell :CGFloat = 1.0
//        let screenWidth = UIScreen.main.bounds.size.width - CGFloat(spaceBetweenCell)
//        let totalSpace = spaceBetweenCell * 1.0
        
        
        
        if indexPath.row == allFeelings.count - 1 {
            
            if allFeelings.count % 2 == 1 {
                return CGSize(width: collectionView.bounds.width, height: 130)
            } else {
                return CGSize(width: 130, height: 130)
            }
        } else {
            
            return CGSize(width: 130, height: 130)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        
        allFeelings[indexPath.row].isSelected = !allFeelings[indexPath.row].isSelected
        
        
        if flag { return }
        
        flag = true
        
        collectionViewFeelings.reloadItems(at: [indexPath])
        
        

        // This will set the flag to TRUE the first time the method is called
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//
//            let mainPage = Storyboards.main.instantiateViewController(withIdentifier: "DailyTasksVC") as! DailyTasksVC
//
//            self.navigationController?.pushViewController(mainPage, animated: true)
//        }
        
    }
    
    
    
}
