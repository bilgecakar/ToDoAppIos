//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 19.03.2022.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNote: UITextField!
    @IBOutlet weak var taskDate: UIDatePicker!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var topView: UIView!
    
    var tastAddPresenterObject : ViewToPresenterTaskAddProtocol?
    
    var dateText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskRouter.createModule(ref: self)
        updateUI()
        
        let sense = UITapGestureRecognizer(target: self, action: #selector(touchSense))
        view.addGestureRecognizer(sense)
        
        taskDate.addTarget(self, action: #selector(self.showDate(uiDatePicker:)), for: .valueChanged)
        
        
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
        dateText = date
        
    }
    
    func updateUI()
    {
        //Top view UI
        topView.layer.cornerRadius = 50
        topView.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        //Temp view UI
        bottomView.layer.cornerRadius = 50
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner]
        
        //Textfield UI
        titleTextfield.layer.cornerRadius = 10
        titleTextfield.layer.masksToBounds = true
        
        //Save Button UI
        saveButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        saveButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        saveButton.layer.shadowOpacity = 1.0
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        if let tt = titleTextfield.text, let tn = taskNote.text
        {
            tastAddPresenterObject?.add(task_title: tt, task_note: tn, task_date: dateText)
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
}
