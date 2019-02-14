
import Foundation

class MainScreenPresenterImpl: MainScreenPresenter {
    
    private weak var view: MainScreenView?
    
    
    init(view: MainScreenView) {
        self.view = view
    }
    
    func didTriggerViewReadyEvent() {

    }
}
