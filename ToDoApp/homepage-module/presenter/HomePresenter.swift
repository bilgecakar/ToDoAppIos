//
//  HomePresenter.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation


class HomePresenter : ViewToPresenterHomePageProtocol
{
    var homepageInteractor: PresenterToInteractorHomePageProtocol?
    
    var homeView: PresenterToViewHomePageProtocol?
    
    func showTask() {
        homepageInteractor?.showAllTask()
    }
    
    func search(word: String) {
        homepageInteractor?.searchTask(word: word)
    }
    
    func delete(task_id: Int) {
        homepageInteractor?.deleteTask(task_id: task_id)
    }
    
    
}

extension HomePresenter : InteractorToPresenterHomePageProtocol
{
    func sendDataToPresenter(tasks: Array<Task>) {
        homeView?.sendDataToView(tasks: tasks)
    }
}
