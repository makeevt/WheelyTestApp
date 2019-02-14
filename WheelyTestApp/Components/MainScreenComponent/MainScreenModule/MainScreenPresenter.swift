
import Foundation

class MainScreenPresenterImpl: MainScreenPresenter {
    
    private weak var view: MainScreenView?
    
    private let counter: CounterModel
    
    
    init(view: MainScreenView, counter: CounterModel) {
        self.view = view
        self.counter = counter
    }
    
    func didTriggerViewReadyEvent() {
        self.view?.configure(counterValue: self.counter.value)
    }
    
    func didTriggerCountUpTapped() {
        self.counter.increment()
        self.view?.configure(counterValue: self.counter.value)
    }
    
    func didTriggerStopLoadTapped(target: ImageTarget) {
        target.stopImageLoading()
    }
    
    func didTriggerLoadImageTapped(target: ImageTarget) {
        target.startImageLoading(urlPath: "https://cdn-images-1.medium.com/fit/c/50/50/1*K-lCI-P9kri0OFjJYUPP2w.jpeg")
    }
}
