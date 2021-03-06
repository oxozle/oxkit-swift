//
//  File.swift
//  OXKit
//
//  Created by Dmitriy on 24/04/2018.
//  Copyright © 2018 Oxozle. All rights reserved.
//

import UIKit

open class OXTableViewCell: UITableViewCell {
    public class var reusableIdentifier: String { return "\(self)" }
    
    public class func registerWithoutNib(tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: reusableIdentifier)
    }
    
    public class func register(tableView: UITableView) {
        tableView.register(UINib.init(nibName: reusableIdentifier, bundle: Bundle.main), forCellReuseIdentifier: reusableIdentifier)
    }
    
    open class var height: CGFloat { return 50}
}
