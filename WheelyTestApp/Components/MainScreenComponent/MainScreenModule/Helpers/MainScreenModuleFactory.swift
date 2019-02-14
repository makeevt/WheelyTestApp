//
//  MainScreenModuleFactory.swift
//  WheelyTestApp
//
//  Created by makeev on 15.02.2019.
//  Copyright © 2019 makeev. All rights reserved.
//

import Foundation
import UIKit

class MainScreenModuleFactory {
    private init() {}
    
    class func generateMainScreenViewController() -> UIViewController {
        let controller = MainScreenViewController()
        let presenter = MainScreenPresenterImpl(view: controller)
        controller.presenter = presenter
        
        return controller
    }
    
}
