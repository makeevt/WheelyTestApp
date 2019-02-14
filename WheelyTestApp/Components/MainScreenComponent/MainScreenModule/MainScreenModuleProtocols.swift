
import Foundation

//MARK: - View

protocol MainScreenView: class {
    func configure(counterValue: Int)
}

//MARK: - Presenter

protocol MainScreenPresenter {
    func didTriggerViewReadyEvent()
    func didTriggerCountUpTapped()
    func didTriggerLoadImageTapped(target: ImageTarget)
    func didTriggerStopLoadTapped(target: ImageTarget)
}
