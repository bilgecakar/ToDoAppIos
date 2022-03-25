//
//  TaskAddInteractor.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation


class TaskAddInteractor : PresenterToInteractorTaskAddProtocol
{
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("gorevler.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    
    func addTask(task_title: String, task_note: String, task_date: String) {
        
        db?.open()
        do{
            try db?.executeUpdate("INSERT INTO tasks (task_title,task_note,task_date) VALUES (?,?,?)", values: [task_title,task_note,task_date])
            
        }catch
        {
            
        }
        db?.close()
    }
    
    
}
