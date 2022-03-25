//
//  TaskDetailRouter.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation

class TaskDetailRouter : PresenterToRouterTaskDetailProtocol
{
    static func createModule(ref: TaskDetailViewController) {
        ref.taskDetailIPresenterObject = TaskDetailPresenter()
        ref.taskDetailIPresenterObject?.taskDetailIndecator = TaskDetailInteractor()
    }
    
    
}
