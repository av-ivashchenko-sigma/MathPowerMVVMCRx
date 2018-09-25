import UIKit

class PickerTextField: UITextField {

    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
}
