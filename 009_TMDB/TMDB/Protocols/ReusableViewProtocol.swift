//
//  ReusableViewProtocol.swift
//  TMDB
//
//  Created by do hee kim on 2023/08/12.
//

import UIKit

protocol ReusableViewProtocol {
    
    static var identifier: String { get }
    
}

extension UIViewController: ReusableViewProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionReusableView: ReusableViewProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableViewProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
