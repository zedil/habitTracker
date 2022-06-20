//
//  MainPageVC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 20.06.2022.
//

import UIKit

class MainPageVC: UIViewController {
    
    @IBOutlet weak var btnSetNow: UIButton!
    
    struct Days {
        var number:String
        var name:String
        var isSelected: Bool
    }
    
    let allDays = [Days(number: "8", name: "Mo", isSelected: false),
                   Days(number: "9", name: "Tu", isSelected: false),
                   Days(number: "10", name: "We", isSelected: false),
                   Days(number: "11", name: "Th", isSelected: false),
                   Days(number: "12", name: "Fr", isSelected: false),
                   Days(number: "13", name: "Sa", isSelected: false),
                   Days(number: "14", name: "Su", isSelected: false)
    ]

    @IBOutlet weak var collectionViewDays: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewDays.delegate = self
        collectionViewDays.dataSource = self
        
        print("main")

        // Do any additional setup after loading the view.
    }



}

extension MainPageVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DaysCVC
        cell.lblDayName.text = allDays[indexPath.row].name
        cell.lblDayNumber.text = allDays[indexPath.row].number
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 100)
    }
    
    
    
}

extension UIImage {
        func renderResizedImage (newWidth: CGFloat) -> UIImage {
            let scale = newWidth / self.size.width
            let newHeight = self.size.height * scale
            let newSize = CGSize(width: newWidth, height: newHeight)

            let renderer = UIGraphicsImageRenderer(size: newSize)

            let image = renderer.image { (context) in
                self.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
            }
            return image
        }
    }
