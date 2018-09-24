import UIKit

class Screen: UIViewController {

    private(set) var _viewModel: ViewModel?

    func connectViewModel(_ viewModel: ViewModel?) {
        _viewModel = viewModel
    }
}
