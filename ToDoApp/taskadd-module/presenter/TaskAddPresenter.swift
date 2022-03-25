//
//  TaskAddPresenter.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation

class TaskAddPresenter : ViewToPresenterTaskAddProtocol
{
    var taskAddInteractor: PresenterToInteractorTaskAddProtocol?
    
    func add(task_title: String, task_note: String, task_date: String) {
        taskAddInteractor?.addTask(task_title: task_title, task_note: task_note, task_date: task_date)
    }
}
