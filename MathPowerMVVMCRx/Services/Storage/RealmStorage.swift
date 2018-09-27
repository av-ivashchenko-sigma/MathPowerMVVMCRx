import Foundation
import RealmSwift
import Result
import ReactiveSwift
import ReactiveCocoa

protocol RealmServiceProtocol {
    var scores: ReactiveSwift.Property<[Score]?> { get }

    func syncScores()
    func saveScore(_ score: Score)
}

class RealmService {
    private(set) lazy var scores: ReactiveSwift.Property<[Score]?> = Property(capturing: _scores)
    private let _scores = MutableProperty<[Score]?>(nil)

    // swiftlint:disable:next force_try
    private let realm = try! Realm()
    private var token: NotificationToken?

    init() {
        token = realm.observe { [weak self] (notification, realm) in self?.observeChanges(notification: notification, realm: realm) }
    }
}

extension RealmService: RealmServiceProtocol {
    func observeChanges(notification: Realm.Notification, realm: Realm) {
        syncScores()
    }

    func syncScores() {
        _scores.value = Array(realm.objects(Score.self))

        // for testing purposes
        _scores.value = {
            (1...50).map { value in
                let difficulty: Difficulty = {
                    switch value {
                    case let one where one % 3 == 0: return .easy
                    case let two where two % 2 == 0: return .medium
                    default: return .hard
                    }
                }()
                return Score(username: "User #\(value)", difficulty: difficulty, score: value * value)
            }
        }()
    }

    func saveScore(_ score: Score) {
        // swiftlint:disable:next force_try
        try! realm.write {
            realm.create(Score.self, value: score.realmValue, update: true)
        }
    }
}
