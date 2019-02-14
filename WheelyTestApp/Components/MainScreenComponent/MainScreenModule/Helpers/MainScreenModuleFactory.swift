
import Foundation
import UIKit

protocol MainScreenModuleFactory {
    static func generateMainScreenViewController() -> UIViewController
}

class MainScreenModuleFactoryImpl: MainScreenModuleFactory {
    private init() {}
    
    static func generateMainScreenViewController() -> UIViewController {
        let controller = MainScreenViewController()
        let presenter = MainScreenPresenterImpl(view: controller)
        controller.presenter = presenter
        
        return controller
    }
    
}
