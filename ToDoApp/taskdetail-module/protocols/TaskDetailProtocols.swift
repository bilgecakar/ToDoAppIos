//
//  TaskDetailProtocols.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation

protocol ViewToPresenterTaskDetailProtocol
{
    var taskDetailIndecator : PresenterToIndecatorTaskDetailProtocol? {get set}
    func update(task_id : Int, task_title : String, task_note : String, task_date : String)
}

protocol PresenterToIndecatorTaskDetailProtocol
{
    func updateTask(task_id : Int, task_title : String, task_note : String, task_date : String)
}

protocol PresenterToRouterTaskDetailProtocol
{
    static func createModule(ref : TaskDetailViewController)
}
