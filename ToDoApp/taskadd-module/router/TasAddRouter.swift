//
//  TasAddRouter.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation


class TaskRouter : PresenterToRouterTaskAddProtocol
{
    static func createModule(ref: AddTaskViewController) {
        ref.tastAddPresenterObject = TaskAddPresenter()
        ref.tastAddPresenterObject?.taskAddInteractor = TaskAddInteractor()
        
    }
    
}
