//
//  ViewController.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 19.06.2022.
//

import UIKit

class focusTypeVC: UIViewController {
    
    struct Habit {
        var image: UIImage
        var habitName: String
        var isSelected: Bool
    }
    
    var habit : Habit!
    var allHabit = [Habit]()
    
    var allHabits = [Habit(image: UIImage(named: "meditation")!, habitName: "Meditation", isSelected: false),
                     Habit(image: UIImage(named: "reading")!, habitName: "Reading", isSelected: false),
                     Habit(image: UIImage(named: "working")!, habitName: "Work", isSelected: false),
                     Habit(image: UIImage(named: "fitness")!, habitName: "fitness", isSelected: false)
    
    ]
    

    
    @IBOutlet weak var collectionViewHabit: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionViewHabit.delegate = self
        collectionViewHabit.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }


}

extension focusTypeVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewHabit.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! habitCVC
        
        cell.imgViewHabit.image = allHabits[indexPath.row].image
        cell.lblHabit.text = allHabits[indexPath.row].habitName
        
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 20
        
        let borderColor: UIColor = (allHabits[indexPath.row].isSelected == true) ? UIColor(named: "purple")! : .white
        cell.layer.borderColor = borderColor.cgColor

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("selected: \(indexPath.row)")
        
        print("deneme: \(allHabits[indexPath.row])")
        
        allHabits[indexPath.row].isSelected = true
        
        collectionViewHabit.reloadData()
        
        
        let mainPage = Storyboards.main.instantiateViewController(withIdentifier: "MainPageVC") as! MainPageVC
        
        //eggTimerPage.boilType = type
        //eggTimerPage.boilTime = time
                    
        self.navigationController?.pushViewController(mainPage, animated: true)
        
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    
    

    
}



