//
//  MainPageVC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 20.06.2022.
//

import UIKit

class MainPageVC: UIViewController {
    
    @IBOutlet weak var btnSetNow: UIButton!
    var dailyTaskList = [TaskViewModel]()
    
    
    @IBOutlet weak var tasksView: UIView!
    @IBOutlet weak var tableViewMainList: UITableView!
    

    
    let allDays = [DayViewModel(number: "8", name: "Mo", isSelected: false),
                   DayViewModel(number: "9", name: "Tu", isSelected: false),
                   DayViewModel(number: "10", name: "We", isSelected: false),
                   DayViewModel(number: "11", name: "Th", isSelected: false),
                   DayViewModel(number: "12", name: "Fr", isSelected: false),
                   DayViewModel(number: "13", name: "Sa", isSelected: false),
                   DayViewModel(number: "14", name: "Su", isSelected: false)
    ]

    @IBOutlet weak var collectionViewDays: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewDays.delegate = self
        collectionViewDays.dataSource = self
        
        tableViewMainList.delegate = self
        tableViewMainList.dataSource = self
        
        print("main")
        print("list: \(dailyTaskList)")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        tasksView.roundCorners(corners: [.topLeft, .topRight], radius: 50)
    }

    @IBAction func btnSetSleep(_ sender: UIButton) {
        
        let sleepPage = Storyboards.main.instantiateViewController(withIdentifier: "SetSleepVC") as! SetSleepVC
        self.navigationController?.pushViewController(sleepPage, animated: true)
        
        
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

extension MainPageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyTaskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTasksTBC
        
        cell.mainTaskLbl.text = dailyTaskList[indexPath.row].task
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("selected")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}



