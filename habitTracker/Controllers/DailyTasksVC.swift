//
//  DailyTasksVC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 22.06.2022.
//

import UIKit

enum TaskType {
    case meditation, work, read, fitness
}

class DailyTasksVC: UIViewController {
    
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var tableViewTasks: UITableView!
    var cellSpacingHeight: CGFloat = 15.0
    var focusTypeList = [HabitViewModel]()
    var selectedItem: Int = 0
    
    
    var allTasks = [TaskViewModel]()
    
    
    var taskType : TaskType = .fitness
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("task type: \(taskType)")
        
        
        
        switch taskType {
        case .meditation:
            allTasks = [
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "Start each day with a mindful breathing technique", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "Choose one daily task to do mindfully", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "Give yourself space to feel your emotions (without judgement)", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "Try the Don't Know Mind technique", isSelected: false)
            ]
        case .work:
            allTasks = [
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "manage your energy", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "turn your phone off and leave it in another room", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "develop a pre-game routine to start your day", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "create a chain for your purpose", isSelected: false)
            ]
        case .read:
            allTasks = [
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "Determine your reading purpose: Leisure or Learning", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "Make notes in the book", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "write about what you read", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "ask yourself: Do i agree with the author? why or why not?", isSelected: false)
            ]
        case .fitness:
            allTasks = [
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "Eat healthy foods for today", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "Squat challenge", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "run 30 miles within one month", isSelected: false),
                TaskViewModel(image: UIImage(named: "taskicon")!, task: "start with a core strength workout challenge", isSelected: false)
            ]
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnContinue.isEnabled = false
        tableViewTasks.delegate = self
        tableViewTasks.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func getSelectedItems() -> [TaskViewModel] {
     
        let filteredData = allTasks.filter({$0.isSelected == true})

        return filteredData
    }
    
    @IBAction func btnContinueAct(_ sender: UIButton) {
        
        
        let mainPage = Storyboards.main.instantiateViewController(withIdentifier: "MainPageVC") as! MainPageVC
        mainPage.dailyTaskList = getSelectedItems()
        self.navigationController?.pushViewController(mainPage, animated: true)
        
        
        
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
        
        if allTasks[indexPath.row].isSelected {
            btnContinue.isEnabled = true

        } else {
            if selectedItem <= 0 {
                btnContinue.isEnabled = false

            }
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//
//        allTasks[indexPath.row].isSelected = !allTasks[indexPath.row].isSelected
        
//
        if allTasks[indexPath.row].isSelected == true {
            allTasks[indexPath.row].isSelected = false
            selectedItem = selectedItem - 1
        } else {
            allTasks[indexPath.row].isSelected = true
            selectedItem = selectedItem + 1
        }
        
        tableViewTasks.reloadRows(at: [indexPath], with: .fade)
        
        
        
    }
    
    
    
}
