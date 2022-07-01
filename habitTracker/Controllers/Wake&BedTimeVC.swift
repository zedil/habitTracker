//
//  Wake&BedTimeVC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 1.07.2022.
//

import UIKit

class Wake_BedTimeVC: UIViewController {

    @IBOutlet weak var tfWakeUp: UITextField!
    
    @IBOutlet weak var tfSleep: UITextField!
    var wakeTime: String = ""
    var sleepTime: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfWakeUp.tag = 0
        tfSleep.tag = 1
        
        
        setTimePicker(textfield: tfWakeUp)
        
        setTimePicker(textfield: tfSleep)


    }
    

    
    @objc func timePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "hh:mm"
        tfWakeUp.text = formatter.string(from: sender.date) + " " + formatter.amSymbol
        
        wakeTime = formatter.string(from: sender.date)
        
        print("wake time : \(wakeTime)")
    }
    
    @objc func timePickerValueChanged2(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "hh:mm"
        tfSleep.text = formatter.string(from: sender.date) + " " + formatter.amSymbol
        
        sleepTime = formatter.string(from: sender.date)
        
        print("sleep time: \(sleepTime)")
        
    }
    
    @objc func dismissPicker() {

        view.endEditing(true)

    }
    
    
    func setTimePicker(textfield: UITextField) {
        
        let time = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "hh:MM"
        //tfWakeUp.text = formatter.string(from: time)
        textfield.textColor = UIColor(named: "blue")
        
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        
        if textfield.tag == 0 {
            
            
            timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: .valueChanged)
            
        } else {
            timePicker.addTarget(self, action: #selector(timePickerValueChanged2(sender:)), for: .valueChanged)
        }
        
        
        timePicker.frame.size = CGSize(width: 0, height: 250)
        timePicker.preferredDatePickerStyle = .wheels
        textfield.inputView = timePicker
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(dismissPicker))

        textfield.inputAccessoryView = toolBar
        
        
    }
    
    
    @IBAction func btnWakeAct(_ sender: UIButton) {
        
        print("wake act")
        
        showAlert(text1: "wake up", text2: wakeTime)
        
        
        
        
    }
    
    
    @IBAction func btnSleepAct(_ sender: UIButton) {
        
        showAlert(text1: "sleep", text2: sleepTime)
        
    }
    
    
    
    func showAlert(text1: String, text2: String) {
        let alertController: UIAlertController = UIAlertController(title: "Succesfull", message: "your \(text1) time is saved as \(text2)", preferredStyle: .alert)
        
        let alert = UIAlertAction(title: "Okay", style: .default) { _ in
            
            self.dismiss(animated: true)
        }
        
        alertController.addAction(alert)
        self.present(alertController, animated: true, completion: nil)
    }
    


}

extension UIToolbar {

func ToolbarPiker(mySelect : Selector) -> UIToolbar {

    let toolBar = UIToolbar()

    toolBar.barStyle = UIBarStyle.default
    toolBar.isTranslucent = true
    toolBar.tintColor = UIColor.black
    toolBar.sizeToFit()

    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

    toolBar.setItems([ spaceButton, doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true

    return toolBar
}

}
