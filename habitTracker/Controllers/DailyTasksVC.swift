//
//  DailyTasksVC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 22.06.2022.
//

import UIKit

class DailyTasksVC: UIViewController {
    
    @IBOutlet weak var tableViewTasks: UITableView!
    var cellSpacingHeight: CGFloat = 15.0
    
    
    var allTasks = [
        TaskViewModel(image: UIImage(named: "taskicon")!, task: "Start each day with a mindful breathing technique", isSelected: false),
        TaskViewModel(image: UIImage(named: "taskicon")!, task: "Choose one daily task to do mindfully", isSelected: false),
        TaskViewModel(image: UIImage(named: "taskicon")!, task: "Give yourself space to feel your emotions (without judgement)", isSelected: false),
        TaskViewModel(image: UIImage(named: "taskicon")!, task: "Try the Don't Know Mind technique", isSelected: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewTasks.delegate = self
        tableViewTasks.dataSource = self
        

        // Do any additional setup after loading the view.
    }


}

extension DailyTasksVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TasksTBC
        
        cell.taskImgView.image = allTasks[indexPath.row].image
        cell.taskLbl.text = allTasks[indexPath.row].task
        
        cell.contentView.backgroundColor = .white
        cell.contentView.layer.cornerRadius = 20
        
        let cellImage: UIImage = (allTasks[indexPath.row].isSelected == true) ? UIImage(named: "completetaskicon")! : UIImage(named: "taskicon")!
        
        cell.taskImgView.image = cellImage
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        allTasks[indexPath.row].isSelected = true
        
        tableViewTasks.reloadData()
        
        let mainPage = Storyboards.main.instantiateViewController(withIdentifier: "MainPageVC") as! MainPageVC
        
        //eggTimerPage.boilType = type
        //eggTimerPage.boilTime = time
                    
        self.navigationController?.pushViewController(mainPage, animated: true)
        
        
        
    }
    
    
    
}
