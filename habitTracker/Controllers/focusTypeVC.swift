//
//  ViewController.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 19.06.2022.
//

import UIKit

class focusTypeVC: UIViewController {
    
    @IBOutlet weak var btnContinue: UIButton!
    
    var selectedCount: Int = 0
    var habit : HabitViewModel!
    var allHabit = [HabitViewModel]()
    var types: TaskType = .fitness
    
    var allHabits = [HabitViewModel(image: UIImage(named: "meditation")!, habitName: "Meditation", isSelected: false),
                     HabitViewModel(image: UIImage(named: "reading")!, habitName: "Reading", isSelected: false),
                     HabitViewModel(image: UIImage(named: "working")!, habitName: "Work", isSelected: false),
                     HabitViewModel(image: UIImage(named: "fitness")!, habitName: "fitness", isSelected: false)
    
    ]
    

    
    @IBOutlet weak var collectionViewHabit: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnContinue.isEnabled = false
        btnContinue.layer.borderWidth = 3
        btnContinue.layer.borderColor = UIColor(named: "purple")!.cgColor
        
        collectionViewHabit.delegate = self
        collectionViewHabit.dataSource = self
        
    }
    
    func getFilteredDatas() -> [HabitViewModel] {
        
        
        let filteredData = allHabits.filter({$0.isSelected == true})

        
        return filteredData
    }
    
    
    @IBAction func btnContinueAct(_ sender: UIButton) {
        
        let mainPage = Storyboards.main.instantiateViewController(withIdentifier: "DailyTasksVC") as! DailyTasksVC
        mainPage.focusTypeList = getFilteredDatas()
        mainPage.taskType = types
        self.navigationController?.pushViewController(mainPage, animated: true)
        
        
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
        
        
        if allHabits[indexPath.row].isSelected {
            btnContinue.isEnabled = true
            btnContinue.layer.borderWidth = 3
            btnContinue.layer.borderColor = UIColor.white.cgColor
            btnContinue.tintColor = .white
            btnContinue.backgroundColor = UIColor(named: "purple")!
        } else {
            print("cell: \(selectedCount)")
            if selectedCount == 0 {
                btnContinue.isEnabled = false
                btnContinue.layer.borderWidth = 3
                btnContinue.layer.borderColor = UIColor(named: "purple")!.cgColor
                btnContinue.tintColor = UIColor(named: "purple")!
                btnContinue.backgroundColor = UIColor.white
            } else {
                btnContinue.isEnabled = true
                btnContinue.layer.borderWidth = 3
                btnContinue.layer.borderColor = UIColor.white.cgColor
                btnContinue.tintColor = .white
                btnContinue.backgroundColor = UIColor(named: "purple")!
            }
        }

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        
//        allHabits[indexPath.row].isSelected = !allHabits[indexPath.row].isSelected
        
        switch indexPath.row {
                
        case 0:
            print("0")
            types = .meditation
        case 1:
            print("1")
            types = .read
        case 2:
            print("2")
            types = .work
        case 3:
            print("3")
            types = .fitness
        default:
            print("default")
        }
        
        if allHabits[indexPath.row].isSelected == true {
            allHabits[indexPath.row].isSelected = false
            selectedCount = selectedCount - 1
            print("count: \(selectedCount)")
        } else {
            allHabits[indexPath.row].isSelected = true
            selectedCount = selectedCount + 1
            print("count tru: \(selectedCount)")
        }

        
        collectionView.reloadItems(at: [indexPath])
        
        
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    
    

    
}



