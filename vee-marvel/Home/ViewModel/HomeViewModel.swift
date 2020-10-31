//
//  HomeViewModel.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 30/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

protocol HomeViewModelViewDelegate: AnyObject {
    func didFetchDataFromAPISucces(sender: HomeViewModel)
    func didFetchDataFromAPIFail(sender: HomeViewModel)
}

struct HomeViewModel {
    
    weak var delegate:HomeViewModelViewDelegate?
    weak var coodinator: AppCoordinator?
    var model:HomeModel?
    weak var viewDelegate:HomeViewModelViewDelegate?
    
    
    func fetchData() {
        
    }
    
    func didSelectRow(at index: Int){
        
    }
    
}
