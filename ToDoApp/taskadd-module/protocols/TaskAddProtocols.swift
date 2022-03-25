//
//  TaskAddProtocols.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation

protocol ViewToPresenterTaskAddProtocol
{
    var taskAddInteractor :  PresenterToInteractorTaskAddProtocol? {get set}
    
    func add(task_title : String, task_note : String, task_date : String)
}

protocol PresenterToInteractorTaskAddProtocol
{
    func addTask(task_title : String, task_note : String, task_date : String)
}

protocol PresenterToRouterTaskAddProtocol
{
    static func createModule(ref : AddTaskViewController)
}
