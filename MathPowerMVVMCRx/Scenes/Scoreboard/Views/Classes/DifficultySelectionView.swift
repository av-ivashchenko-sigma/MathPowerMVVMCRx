import UIKit
import Result
import ReactiveSwift
import ReactiveCocoa

class DifficultySelectionView: UIView {
    private var stackView = UIStackView()
    private var buttons: [UIButton] = []

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupBaseStyle()
        setupBaseViewHierarchy()
        setupBaseLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(viewModel: DifficultySelectionViewModelProtocol) {
        viewModel.difficulties.producer
            .combineLatest(with: viewModel.selectedDifficulty)
            .take(duringLifetimeOf: reactive.lifetime)
            .startWithValues { [weak self] (difficulties, selectedDifficulty) in
                guard let self = self else { return }
                self.stackView.removeArrangedSubviews()
                self.buttons = difficulties.map { difficulty in
                    let button = UIButton()
                    button.setTitle(difficulty.title, for: .normal)
                    button.layer.borderColor = UIColor.white.cgColor
                    button.layer.borderWidth = 2
                    button.backgroundColor = difficulty == selectedDifficulty ? .white : .clear
                    button.titleLabel?.font = UIFont.buttonFont
                    button.setTitleColor(difficulty == selectedDifficulty ? .black : .white, for: .normal)
                    button.reactive.pressed = CocoaAction(viewModel.selectDifficulty, input: difficulty.rawValue)
                    return button
                }
                self.setupButtonsViewHierarchy()
                self.setupButtonsLayout()
        }
    }
}

private extension DifficultySelectionView {
    func setupBaseStyle() {
        stackView.distribution = .equalCentering
        stackView.axis = .horizontal
        stackView.spacing = 32
        stackView.alignment = .center
    }

    func setupBaseViewHierarchy() {
        addSubview(stackView)
    }

    func setupBaseLayout() {
        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(stackView.spacing / 2)
            make.right.equalToSuperview().offset(-stackView.spacing / 2)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
    }

    func setupButtonsViewHierarchy() {
        buttons.forEach(stackView.addArrangedSubview)
    }

    func setupButtonsLayout() {
        buttons.forEach { b in b.snp.makeConstraints { make in make.width.equalToSuperview().offset(-stackView.spacing * 2).dividedBy(buttons.count) } }
    }
}
