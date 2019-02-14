//
//  MainScreenViewController.swift
//  WheelyTestApp
//
//  Created by makeev on 15.02.2019.
//  Copyright © 2019 makeev. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, MainScreenView {
    
    //MARK:- Constants
    
    private struct Constants {
        
    }
    
    //MARK:- Public properties
    
    var presenter: MainScreenPresenter!
    
    //MARK:- Outlets
    
    
    
    //MARK:- Private properties
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.didTriggerViewReadyEvent()
    }
    
    // MARK: - Public methods
    
    func configure() {
        
    }
    
    // MARK: - Private methods
    
}
