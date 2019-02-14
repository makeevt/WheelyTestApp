
import Foundation

//MARK: - View

protocol MainScreenView: class {
    func configure()
}

//MARK: - Presenter

protocol MainScreenPresenter {
    func didTriggerViewReadyEvent()
}
