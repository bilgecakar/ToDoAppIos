//
//  HomePageProtocols.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation


protocol PresenterToInteractorHomePageProtocol //Interactor Katmani
{
    var homePresenter : InteractorToPresenterHomePageProtocol? {get set}
    
    func showAllTask()
    func searchTask(word:String)
    func deleteTask(task_id:Int)
    
    
}

protocol ViewToPresenterHomePageProtocol //Presenter Katmani
{
    var homepageInteractor : PresenterToInteractorHomePageProtocol? {get set}
    var homeView : PresenterToViewHomePageProtocol? {get set}
    
    func showTask()
    func search(word:String)
    func delete(task_id:Int)
}



protocol InteractorToPresenterHomePageProtocol
{
    func sendDataToPresenter(tasks : Array<Task>)
}

protocol PresenterToViewHomePageProtocol
{
    func sendDataToView(tasks : Array<Task>)
}

protocol PreseneterToRouterHomePageProtocol
{
    static func createModule(ref: ViewController)
}

