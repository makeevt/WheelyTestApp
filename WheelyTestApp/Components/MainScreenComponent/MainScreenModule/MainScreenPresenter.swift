//
//  MainScreenPresenter.swift
//  WheelyTestApp
//
//  Created by makeev on 15.02.2019.
//  Copyright © 2019 makeev. All rights reserved.
//

import Foundation

class MainScreenPresenterImpl: MainScreenPresenter {
    
    private weak var view: MainScreenView?
    
    
    init(view: MainScreenView) {
        self.view = view
    }
    
    func didTriggerViewReadyEvent() {

    }
}
