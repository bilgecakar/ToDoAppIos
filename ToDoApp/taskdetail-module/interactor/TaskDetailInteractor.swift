//
//  TaskDetailInteractor.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation

class TaskDetailInteractor : PresenterToIndecatorTaskDetailProtocol
{
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("gorevler.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    func updateTask(task_id: Int, task_title: String, task_note: String, task_date :  String) {
        db?.open()
        do{
            try db?.executeUpdate("UPDATE tasks SET task_title = ?, task_note = ?, task_date = ? WHERE task_id = ?", values: [task_title,task_note,task_date,task_id])
            
        }catch
        {
            
        }
        db?.close()
        
    }
    
    
}
