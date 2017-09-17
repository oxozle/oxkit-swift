//
//  Dictionary.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 06/09/2017.
//  Copyright © 2017 Oxozle. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary {
    public func sortedKeys(isOrderedBefore:(Key,Key) -> Bool) -> [Key] {
        return Array(self.keys).sorted(by: isOrderedBefore)
    }
    
    public func keysSortedByValue(isOrderedBefore:(Value, Value) -> Bool) -> [Key] {
        return Array(self)
            .sorted() {
                let (_, lv) = $0
                let (_, rv) = $1
                return isOrderedBefore(lv, rv)
            }
            .map {
                let (k, _) = $0
                return k
        }
    }
}
