import UIKit
import Result
import ReactiveSwift
import ReactiveCocoa

class StartGameScreen: Screen {
    var viewModel: StartGameViewModelProtocol {
        guard let _viewModel = _viewModel as? StartGameViewModelProtocol else { fatalError("viewModel is not StartGameViewModelProtocol") }
        return _viewModel
    }

    private let nameCaptionLabel = UILabel()
    private let nameTextField = UITextField()

    private let difficultyPickerViewToolbar = UIToolbar()
    private let difficultyPickerViewDoneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                                                 target: nil,
                                                                 action: nil)
    private let difficultyCaptionLabel = UILabel()
    private let difficultyTextField = PickerTextField()
    private let difficultyPickerView = UIPickerView()

    private let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewHierarchy()
        setupStyle()
        setupContent()
        setupLayout()
        setupObserving()
    }
}

private extension StartGameScreen {
    func setupViewHierarchy() {
        [nameCaptionLabel, nameTextField, difficultyCaptionLabel, difficultyTextField, startButton].forEach(view.addSubview)
    }

    func setupStyle() {
        view.backgroundColor = .yellow
        [nameCaptionLabel, difficultyCaptionLabel].forEach {
            $0.font = UIFont.captionLabelFont
            $0.textColor = .black
        }

        nameCaptionLabel.text = L.StartGame.nameCaptionLabelText
        nameTextField.font = UIFont.inputFont
        nameTextField.placeholder = L.StartGame.nameLabelPlaceholderText
        nameTextField.backgroundColor = .lightGray

        difficultyCaptionLabel.text = L.StartGame.difficultyCaptionLabelText
        difficultyTextField.font = UIFont.inputFont
        difficultyTextField.backgroundColor = .lightGray
        difficultyTextField.textAlignment = .center

        startButton.setTitle(L.StartGame.startButtonText, for: .normal)
        startButton.backgroundColor = .green
    }

    func setupContent() {
        title = L.StartGame.title
        difficultyPickerView.delegate = self
        difficultyPickerView.dataSource = self
        difficultyTextField.inputView = difficultyPickerView
        difficultyPickerViewToolbar.sizeToFit()
        difficultyPickerViewToolbar.items = [difficultyPickerViewDoneButton]
        difficultyTextField.inputAccessoryView = difficultyPickerViewToolbar
        difficultyPickerView.reloadAllComponents()
    }

    func setupLayout() {
        nameCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
        }

        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameCaptionLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(44)
        }

        difficultyCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }

        difficultyTextField.snp.makeConstraints { make in
            make.top.equalTo(difficultyCaptionLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(44)
        }

        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(44)
        }
    }

    func setupObserving() {
        viewModel.selectedDifficulty.bindingTarget <~
            difficultyPickerView.reactive.selections.producer.combineLatest(with: viewModel.difficulties.producer).map { $0.1[$0.0.row] }
        startButton.reactive.pressed = CocoaAction(viewModel.startAction)
        difficultyTextField.reactive.text <~ viewModel.selectedDifficulty.map { $0.title }
        viewModel.name <~ nameTextField.reactive.continuousTextValues
        difficultyPickerViewDoneButton.reactive.pressed = CocoaAction(Action<(), (), NoError>(execute: { [weak self] _ in
            self?.difficultyTextField.resignFirstResponder()
            return .empty
        }))
    }
}

extension StartGameScreen: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.difficulties.value.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.difficulties.value[row].title
    }
}
