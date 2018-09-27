import UIKit
import Result
import ReactiveSwift
import ReactiveCocoa

class ScoreTableViewCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let scoreLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViewHierarchy()
        setupStyle()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(viewModel: ScoreCellViewModel) {
        reactive.lifetime += nameLabel.reactive.text <~ viewModel.name
        reactive.lifetime += scoreLabel.reactive.text <~ viewModel.score.map { "\($0)"}
    }
}

private extension ScoreTableViewCell {
    func setupViewHierarchy() {
        addSubview(nameLabel)
        addSubview(scoreLabel)
    }

    func setupStyle() {
        nameLabel.textColor = C.dark.color
        scoreLabel.textColor = C.dark.color

        nameLabel.font = UIFont.cellRegularFont
        scoreLabel.font = UIFont.cellBoldFont

        nameLabel.textAlignment = .left
        scoreLabel.textAlignment = .right
    }

    func setupLayout() {
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }

        scoreLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
    }
}
