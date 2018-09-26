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
//        _scores.value = Array(realm.objects(Score.self))
    }

    func saveScore(_ score: Score) {
        // swiftlint:disable:next force_try
        try! realm.write {
//            realm.create(Score.self, value: score.realmValue, update: true)
        }
    }
}
