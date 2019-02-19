
import Foundation

class MainScreenPresenterImpl: MainScreenPresenter {
    
    private struct Constants {
        static let defaultUrl = "https://i.imgflip.com/ze9f1.jpg"
    }
    
    private weak var view: MainScreenView?
    
    private let counter: CounterModel
    private var lastLoadedImageUrl: String?
    
    
    init(view: MainScreenView, counter: CounterModel) {
        self.view = view
        self.counter = counter
    }
    
    func didTriggerViewReadyEvent() {
        self.view?.configure(counterValue: self.counter.value)
        self.view?.imageUrl = Constants.defaultUrl
        self.view?.configure(buttonsState: .loading)
    }
    
    func didTriggerCountUpTapped() {
        self.counter.increment()
    }
    
    func didTriggerStopLoadTapped(target: ImageTarget) {
        target.stopImageLoading()
        self.view?.configure(buttonsState: .loading)
    }
    
    func didTriggerLoadImageTapped(target: ImageTarget) {
        guard let urlString = self.view?.imageUrl else {
            return
        }
        self.view?.configure(buttonsState: .stopLoading)
        target.startImageLoading(urlPath: urlString, completion: { [weak target, weak self] image in
            Thread.do_onMainThread {
                target?.endImageLoading(image: image)
                
                guard let self = self else { return }
                let isSuccess: Bool = image != nil
                self.lastLoadedImageUrl = isSuccess ? urlString : nil
                let state: MainScreenViewAvailibleActionsState = isSuccess ? .nothing : .loading
                self.view?.configure(buttonsState: state)
            }
        })
    }
    
    func didTriggerTextFieldChanged(text: String) {
        if text == "" {
            self.view?.configure(buttonsState: .nothing)
            return
        }
        guard let url = self.lastLoadedImageUrl else {
            self.view?.configure(buttonsState: .loading)
            return
        }
        let state: MainScreenViewAvailibleActionsState = url == text ? .nothing : .loading
        self.view?.configure(buttonsState: state)
    }
}

extension MainScreenPresenterImpl: CounterModelDelegate {
    
    func counterModelDidChangeValue(_ counterModel: CounterModel, newValue: Int) {
        self.view?.configure(counterValue: self.counter.value)
    }
    
}
