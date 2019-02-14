
import Foundation

protocol ImageTarget: class {
    func startImageLoading(urlPath: String)
    func stopImageLoading()
}
