//
//  HomeRouter.swift
//  ToDoApp
//
//  Created by Bilge Çakar on 21.03.2022.
//

import Foundation


class HomeRouter : PreseneterToRouterHomePageProtocol
{
    static func createModule(ref: ViewController) {
        let presenter = HomePresenter()
        
        //View
        ref.homePresenterObject = presenter
        
        //Presenter
        ref.homePresenterObject?.homepageInteractor = HomeInteractor()
        ref.homePresenterObject?.homeView = ref
        
        //Interactor
        ref.homePresenterObject?.homepageInteractor?.homePresenter = presenter
        
        
        
    }
    
    
}
