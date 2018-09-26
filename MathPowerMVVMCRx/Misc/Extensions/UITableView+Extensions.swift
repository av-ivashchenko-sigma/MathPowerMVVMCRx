import UIKit

extension UITableView {
    func registerNib(type: UITableViewCell.Type) {
        let typeName = String(describing: type)
        register(UINib(nibName: typeName, bundle: Bundle.main), forCellReuseIdentifier: typeName)
    }

    func registerClass(type: UITableViewCell.Type) {
        let typeName = String(describing: type)
        register(type, forCellReuseIdentifier: typeName)
    }

    func dequeueCell<T>(_ type: T.Type) -> T? {
        let typeName = String(describing: type)
        return dequeueReusableCell(withIdentifier: typeName) as? T
    }
}
