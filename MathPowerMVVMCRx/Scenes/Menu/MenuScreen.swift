import UIKit
import Result
import ReactiveSwift
import ReactiveCocoa
import SnapKit

class MenuScreen: Screen {
    var viewModel: MenuViewModelProtocol {
        guard let _viewModel = _viewModel as? MenuViewModelProtocol else { fatalError("viewModel is not MenuViewModelProtocol") }
        return _viewModel
    }

    private let titleLabel = UILabel()
    private let startGameButton = UIButton()
    private let scoreboardButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewHierarchy()
        setupStyle()
        setupContent()
        setupLayout()
        setupObserving()
    }
}

private extension MenuScreen {
    func setupViewHierarchy() {
        [titleLabel, startGameButton, scoreboardButton].forEach(view.addSubview)
    }
    func setupStyle() {
        view.backgroundColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .black

        [startGameButton, scoreboardButton].forEach {
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        }
    }

    func setupContent() {
        title = L.Menu.title
        titleLabel.text = L.Menu.logoTitle
        startGameButton.setTitle(L.Menu.startGameTitle, for: .normal)
        scoreboardButton.setTitle(L.Menu.scoreboardTitle, for: .normal)
    }

    func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
        }

        startGameButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-40)
        }

        scoreboardButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(40)
        }
    }

    func setupObserving() {
        startGameButton.reactive.pressed = CocoaAction(viewModel.showStartGameAction)
        scoreboardButton.reactive.pressed = CocoaAction(viewModel.showScoreboardAction)
    }
}
