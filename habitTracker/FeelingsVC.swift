//
//  feelingsVC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 21.06.2022.
//

import UIKit

class FeelingsVC: UIViewController {
    
    
    struct Feelings {
        var image: UIImage
        var name: String
        var isSelected: Bool
    }
    
    let allFeelings = [Feelings(image: UIImage(named: "awful")!, name: "awful", isSelected: false),
                       Feelings(image: UIImage(named: "bad")!, name: "bad", isSelected: false),
                       Feelings(image: UIImage(named: "happy")!, name: "happy", isSelected: false),
                       Feelings(image: UIImage(named:"okay")!, name: "okay", isSelected: false),
                       Feelings(image: UIImage(named: "sad")!, name: "sad", isSelected: false),
                       Feelings(image: UIImage(named: "sick")!, name: "sick", isSelected: false),
                       Feelings(image: UIImage(named: "unsure")!, name: "unsure", isSelected: false)
    ]
    

    @IBOutlet weak var collectionViewFeelings: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewFeelings.dataSource = self
        collectionViewFeelings.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
    
    
    
}
