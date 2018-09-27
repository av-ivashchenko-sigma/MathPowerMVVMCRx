import UIKit
import Result
import ReactiveSwift
import ReactiveCocoa

class ScoreboardScreen: Screen {
    var viewModel: ScoreboardViewModelProtocol {
        guard let _viewModel = _viewModel as? ScoreboardViewModelProtocol else { fatalError("viewModel is not ScoreboardViewModelProtocol") }
        return _viewModel
    }
    private let tableView = UITableView()
    private let difficultySelectionView = DifficultySelectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewHierarchy()
        setupStyle()
        setupContent()
        setupLayout()
        setupObserving()
    }
}

private extension ScoreboardScreen {
    func setupViewHierarchy() {
        view.addSubview(difficultySelectionView)
        view.addSubview(tableView)
    }

    func setupStyle() {
        view.backgroundColor = .blue
        tableView.backgroundColor = .clear
    }

    func setupContent() {
        title = L.Scoreboard.title
        tableView.registerClass(type: ScoreTableViewCell.self)
    }

    func setupLayout() {
        difficultySelectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(difficultySelectionView.snp.bottom).offset(15)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func setupObserving() {
        viewModel.cellsViewModels.producer.startWithValues { [weak self] _ in self?.tableView.reloadData() }
    }
}

extension ScoreboardScreen: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellsViewModels.value?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(ScoreTableViewCell.self),
            let cellViewModel = viewModel.cellsViewModels.value?[indexPath.row] else { fatalError() }
        cell.setup(viewModel: cellViewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
