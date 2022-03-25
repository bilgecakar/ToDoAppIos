//
//  Task.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 20.03.2022.
//

import Foundation

class Task
{
    var task_id : Int?
    var task_title : String?
    var task_note : String?
    var task_date : String?
    
    init()
    {
        
    }
    
    init(task_id : Int,task_title : String, task_note : String, task_date : String)
    {
        self.task_id = task_id
        self.task_title = task_title
        self.task_note = task_note
        self.task_date = task_date
    }
}
