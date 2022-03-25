//
//  TaskDetailPresenter.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation

class TaskDetailPresenter : ViewToPresenterTaskDetailProtocol
{
    var taskDetailIndecator: PresenterToIndecatorTaskDetailProtocol?
    
    func update(task_id: Int, task_title: String, task_note: String, task_date : String) {
        taskDetailIndecator?.updateTask(task_id: task_id, task_title: task_title, task_note: task_note, task_date : task_date)
    }
    
    
}
