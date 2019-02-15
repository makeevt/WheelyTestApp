

import UIKit

class MainScreenViewController: UIViewController, MainScreenView {
    
    //MARK:- Constants
    
    private struct Constants {
        static let counterLabelText = "mainScreen.counterLabelTitle".localized
    }
    
    //MARK:- Public properties
    
    var presenter: MainScreenPresenter!
    
    var imageUrl: String {
        get {
            return self.textView.text ?? ""
        }
        set {
            self.textView.text = newValue
        }
    }
    
    //MARK:- Outlets
    
    @IBOutlet private weak var imageView: LoadableImageView!
    @IBOutlet private weak var textView: UITextField!
    @IBOutlet private weak var countLabel: UILabel!
    
    @IBOutlet private weak var loadButton: UIButton!
    @IBOutlet private weak var stopLoadButton: UIButton!
    @IBOutlet private weak var countUpButton: UIButton!
    
    
    //MARK:- Private properties
    
    private var buttonsState: MainScreenViewAvailibleActionsState = .nothing
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.didTriggerViewReadyEvent()
    }
    
    // MARK: - Public methods
    
    func configure(counterValue: Int) {
        self.countLabel.text = String(format: Constants.counterLabelText, counterValue)
    }
    
    func configure(buttonsState: MainScreenViewAvailibleActionsState) {
        self.buttonsState = buttonsState
        self.updateInterfaceEnabled()
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
    
    @IBAction func textViewEditingChanged(_ sender: UITextField) {
        self.presenter.didTriggerTextFieldChanged(text: sender.text ?? "")
    }
    
    // MARK: - Private methods
    
    private func updateInterfaceEnabled() {
        switch self.buttonsState {
        case .loading:
            self.stopLoadButton.isEnabled = false
            self.loadButton.isEnabled = true
            self.textView.isEnabled = true
        case .stopLoading:
            self.stopLoadButton.isEnabled = true
            self.loadButton.isEnabled = false
            self.textView.isEnabled = false
        case .nothing:
            self.stopLoadButton.isEnabled = false
            self.loadButton.isEnabled = false
            self.textView.isEnabled = true
        }
    }
    
}
