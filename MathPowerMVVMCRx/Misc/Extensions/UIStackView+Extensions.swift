import UIKit

extension UIStackView {
    func removeArrangedSubviews() {
        arrangedSubviews.forEach(self.removeArrangedSubviewFromSuperview)
    }
    func removeArrangedSubviewFromSuperview(_ view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
}
