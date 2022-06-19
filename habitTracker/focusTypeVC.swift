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
    }
    
    var habit : Habit!
    var allHabit = [Habit]()
    
    let allHabits = [Habit(image: UIImage(named: "meditation")!, habitName: "Meditation"),
                    Habit(image: UIImage(named: "reading")!, habitName: "Reading"),
                    Habit(image: UIImage(named: "working")!, habitName: "Work"),
                    Habit(image: UIImage(named: "fitness")!, habitName: "fitness")
    
    ]
    

    
    @IBOutlet weak var collectionViewHabit: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionViewHabit.delegate = self
        collectionViewHabit.dataSource = self
        
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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    
    

    
}



