//
//  SetSleepVC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 30.06.2022.
//

import UIKit

class SetSleepVC: UIViewController {
    
    
    @IBOutlet weak var sleepProgressView: SleepProgressBar!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        sleepProgressView.trackColor = .red
        sleepProgressView.progressColor = .blue
        sleepProgressView.tag = 11
        
        self.perform(#selector(animateProgress), with: nil, afterDelay: 0.3)
        sleepProgressView.trackColor = UIColor.white
        sleepProgressView.progressColor = .purple
        //sleepProgressView.setProgressWithAnimation(duration: 1.0, value: 10.0)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func animateProgress() {
        let sleepProgressView = self.view.viewWithTag(11) as! SleepProgressBar
        sleepProgressView.setProgressWithAnimation(duration: 1.0, value: 0.7)
    }
    
    
    
    
    @IBAction func btnClockPickerAct(_ sender: UIButton) {
        
        
        let sleepPage = Storyboards.main.instantiateViewController(withIdentifier: "Wake_BedTimeVC") as! Wake_BedTimeVC
        self.navigationController?.pushViewController(sleepPage, animated: true)
        
        
    }
}
