
import Foundation
import UIKit

protocol MainScreenModuleFactory {
    static func generateMainScreenViewController() -> UIViewController
}

class MainScreenModuleFactoryImpl: MainScreenModuleFactory {
    private init() {}
    
    static func generateMainScreenViewController() -> UIViewController {
        let controller = MainScreenViewController()
        let counter = CounterModelImpl()
        let presenter = MainScreenPresenterImpl(view: controller, counter: counter)
        controller.presenter = presenter
        
        return controller
    }
    
}
