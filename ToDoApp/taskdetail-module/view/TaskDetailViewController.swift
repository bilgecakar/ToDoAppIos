//
//  TaskDetailViewController.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var taskNote: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var task : Task?
    var dateData : String = ""
    var taskDetailIPresenterObject : ViewToPresenterTaskDetailProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t = task
        {
            taskTitle.text = t.task_title
            taskNote.text = t.task_note
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            dateFormatter.locale = Locale(identifier: "en")
            if let taskDate = dateFormatter.date(from: t.task_date!)
            {
                
                datePicker.date = taskDate
                
            }
            
            
            
        }
        
        TaskDetailRouter.createModule(ref: self)
        updateUI()
        
      
        
        datePicker.addTarget(self, action: #selector(self.showDate(uiDatePicker:)), for: .valueChanged)
        
        
    }
    
    @objc func touchSense()
    {
        view.endEditing(true)
    }
    
    @objc func showDate(uiDatePicker : UIDatePicker)
    {
        let format = DateFormatter()
        format.dateFormat = "MMM d, yyyy"
        format.locale = Locale(identifier: "en")
        let date = format.string(from: uiDatePicker.date)
        print(date)
        dateData = date
        
    }
    
    func updateUI()
    {
        //Top View UI
        topView.layer.cornerRadius = 40
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        //Circle Button UI
        updateButton.layer.cornerRadius = 10
        updateButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        updateButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        updateButton.layer.shadowOpacity = 1.0
        
    }
    
    
    @IBAction func updateData(_ sender: Any) {
        
        if let tt = taskTitle.text, let tn = taskNote.text, let t = task
        {
            taskDetailIPresenterObject?.update(task_id: t.task_id!, task_title: tt, task_note: tn, task_date: dateData )
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
