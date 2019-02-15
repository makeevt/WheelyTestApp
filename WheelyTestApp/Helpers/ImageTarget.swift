
import Foundation
import UIKit

protocol ImageTarget: class {
    func startImageLoading(urlPath: String, completion: ((UIImage?) -> Void)?)
    func endImageLoading(image: UIImage?)
    func stopImageLoading()
}
