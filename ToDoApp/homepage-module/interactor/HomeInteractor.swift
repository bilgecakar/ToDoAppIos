//
//  HomeInteractor.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation


class HomeInteractor : PresenterToInteractorHomePageProtocol
{
    var homePresenter: InteractorToPresenterHomePageProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("gorevler.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func showAllTask() {
        var liste = [Task]()
        db?.open()
        
        do{
            let c = try db!.executeQuery("SELECT * FROM tasks", values: nil)
            
            while c.next() {
                
                let task_id = Int(c.string(forColumn: "task_id"))!
                let task_title = c.string(forColumn: "task_title")!
                let task_note = c.string(forColumn: "task_note")!
                let task_date  = c.string(forColumn: "task_date")!
                
                let task = Task(task_id: task_id, task_title: task_title, task_note: task_note, task_date: task_date)
                liste.append(task)
            }
            
            homePresenter?.sendDataToPresenter(tasks: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func searchTask(word: String) {
        var liste = [Task]()
        db?.open()
        
        do{
            let c = try db!.executeQuery("SELECT * FROM tasks WHERE task_title like '%\(word)%'", values: nil)
            
            while c.next() {
                let task_id = Int(c.string(forColumn: "task_id"))!
                let task_title = c.string(forColumn: "task_title")!
                let task_note = c.string(forColumn: "task_note")!
                let task_date  = c.string(forColumn: "task_date")!
                
                let task = Task(task_id: task_id, task_title: task_title, task_note: task_note, task_date: task_date)
                liste.append(task)
            }
            
            homePresenter?.sendDataToPresenter(tasks: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func deleteTask(task_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM tasks WHERE task_id = ?", values: [task_id])
            showAllTask()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
}
