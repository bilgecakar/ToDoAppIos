//
//  ViewController.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 19.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var taskTableview: UITableView!
    
    var taskList = [Task]()
    var homePresenterObject : ViewToPresenterHomePageProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        taskTableview.delegate = self
        taskTableview.dataSource =  self
        
        updateUI()
        copyDatabase()
        HomeRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObject?.showTask()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskDetail"
        {
            let task = sender as? Task
            let destinotionVC = segue.destination as! TaskDetailViewController
            destinotionVC.task = task
        }
    }
    
    func copyDatabase()
    {
        let bundleWay = Bundle.main.path(forResource: "gorevler", ofType: ".sqlite")
        
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        
        let coppiedWay = URL(fileURLWithPath: targetWay).appendingPathComponent("gorevler.sqlite")
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: coppiedWay.path) {
            print("Veritabanı zaten var.")
        }else{
            do {
                try fileManager.copyItem(atPath: bundleWay!, toPath: coppiedWay.path)
            }catch{}
        }
    }
    
    func updateUI()
    {
        //Top View UI
        topView.layer.cornerRadius = 50
        topView.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        //Bottom View UI
        bottomView.layer.cornerRadius = 50
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner]
        
        //Circle Button UI
        circleButton.layer.cornerRadius = circleButton.frame.width / 2
        circleButton.layer.masksToBounds = false
        circleButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        circleButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        circleButton.layer.shadowOpacity = 1.0
        
        //Searcbar UI
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            
            textfield.backgroundColor = UIColor.white
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
            
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.black
            }
            
        }
        
        
    }
    
    
    @IBAction func newTaskButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toAddTaskPage", sender: nil)
    }
}


extension ViewController : PresenterToViewHomePageProtocol
{
    func sendDataToView(tasks: Array<Task>) {
        self.taskList = tasks
        self.taskTableview.reloadData()
    }
    
    
}

extension ViewController : UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homePresenterObject?.search(word: searchText)
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = taskList[indexPath.row]
        let cell = taskTableview.dequeueReusableCell(withIdentifier: "taskHucre", for: indexPath) as! TaskTableViewCell
        
        cell.taskTitle.text = "\(task.task_title!)"
        cell.dateLabel.text = "\(task.task_date!)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        performSegue(withIdentifier: "toTaskDetail", sender: task)
        taskTableview.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: ""){(contextualAction,view,bool) in
            let task = self.taskList[indexPath.row]
            
            let alert = UIAlertController(title: "Are you sure want to delete \(task.task_title!)?", message: "You cannot undo this action", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in }
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.homePresenterObject?.delete(task_id: task.task_id!)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        deleteAction.backgroundColor = UIColor(named: "ButtonColor")
        deleteAction.image = UIImage(named: "Delete.png")
        
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
}

