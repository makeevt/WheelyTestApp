

import UIKit

class MainScreenViewController: UIViewController, MainScreenView {
    
    //MARK:- Constants
    
    private struct Constants {
        static let counterLabelText = "mainScreen.counterLabelTitle".localized
    }
    
    //MARK:- Public properties
    
    var presenter: MainScreenPresenter!
    
    //MARK:- Outlets
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textView: UITextField!
    @IBOutlet private weak var countLabel: UILabel!
    
    @IBOutlet private weak var loadButton: UIButton!
    @IBOutlet private weak var stopLoadButton: UIButton!
    @IBOutlet private weak var countUpButton: UIButton!
    
    
    //MARK:- Private properties
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.didTriggerViewReadyEvent()
    }
    
    // MARK: - Public methods
    
    func configure(counterValue: Int) {
        self.countLabel.text = String(format: Constants.counterLabelText, counterValue)
    }
    
    // MARK: - Actions
    
    @IBAction private func loadButtonTapped(_ sender: Any) {
        self.presenter.didTriggerLoadImageTapped(target: self.imageView)
    }
    
    @IBAction private func stopButtonTapped(_ sender: Any) {
        self.presenter.didTriggerStopLoadTapped(target: self.imageView)
    }
    
    @IBAction private func countUpButtonTapped(_ sender: Any) {
        self.presenter.didTriggerCountUpTapped()
    }
    
    // MARK: - Private methods
    
    
    
}
