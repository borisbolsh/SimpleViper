//
//  ReuseIdentifiable.swift
//  SimpleViper
//
//  Created by Boris Bolshakov on 27.12.21.
//

import UIKit

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {
}

extension UITableViewHeaderFooterView: ReuseIdentifiable {
}

extension UICollectionReusableView: ReuseIdentifiable {
}

extension UICollectionView {
    func dequeueCell<T: UICollectionViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier,
                for: indexPath) as? T else {
            fatalError("can't dequeue")
        }
        return cell
    }
}

extension UITableView {
    func dequeueCell<T: UITableViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier,
                for: indexPath) as? T else {
            fatalError("can't dequeue")
        }
        return cell
    }

    func register<T: UITableViewCell>(_ cellType: T.Type) {
        self.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}

