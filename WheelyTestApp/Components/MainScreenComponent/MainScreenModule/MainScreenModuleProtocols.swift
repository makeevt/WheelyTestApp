
import Foundation

//MARK: - View

enum MainScreenViewAvailibleActionsState {
    case loading
    case stopLoading
    case nothing
}

protocol MainScreenView: class {
    var imageUrl: String {get set}
    func configure(counterValue: Int)
    func configure(buttonsState: MainScreenViewAvailibleActionsState)
}

//MARK: - Presenter

protocol MainScreenPresenter {
    func didTriggerViewReadyEvent()
    func didTriggerCountUpTapped()
    func didTriggerLoadImageTapped(target: ImageTarget)
    func didTriggerStopLoadTapped(target: ImageTarget)
    func didTriggerTextFieldChanged(text: String)
}
