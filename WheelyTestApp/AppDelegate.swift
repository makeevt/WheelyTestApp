

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewController = MainScreenModuleFactoryImpl.generateMainScreenViewController()
        window.rootViewController = viewController
        
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }


}

