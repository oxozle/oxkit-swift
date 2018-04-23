//
//  Localization.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 29/12/2016.
//  Copyright © 2016 Oxozle. All rights reserved.
//

import Foundation

final class LocalizeTableKeysCache {
    static let i = LocalizeTableKeysCache()
    
    fileprivate var dict: [String: String]
    
    fileprivate init() {
        dict = [String: String]()
    }
    
    func getTable(_ key: String) -> String {
        if let exist = dict[key] {
            return exist
        }
        
        if let textRange = key.range(of: ".") {
            let table = String(key[..<textRange.lowerBound])
            dict[key] = table
            return table
        }
        
        return ""
    }
}

public extension String {
    
    /// Localizae string
    public func localized() -> String {
//        let selectedLanguage = QRKit.application.language
//        if let path = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj"),
//            let bundle = Bundle(path: path) {
//            return NSLocalizedString(self,
//                                     tableName: LocalizeTableKeysCache.i.getTable(self),
//                                     bundle: bundle,
//                                     value: self,
//                                     comment: self)
//        }
//        return self
        return NSLocalizedString(self,
                                 tableName: LocalizeTableKeysCache.i.getTable(self),
                                 bundle: Bundle.main,
                                 value: self,
                                 comment: self)
    }
    
    /// Localizae string with arguments
    ///
    /// - parameter arguments: string format arguments
    public func localizedFormat(_ arguments: CVarArg...) -> String {
        let template = self.localized()
        return String(format: template, arguments: arguments)
    }
    
    /// True if string starts with prefix
    ///
    /// - parameter string: prefix
    public func startsWith(_ string: String) -> Bool {
        guard let range = range(of: string, options:[.anchored, .caseInsensitive]) else {
            return false
        }
        
        return range.lowerBound == startIndex
    }
    
    
    /// True if string contains another string
    ///
    /// - Parameter other: find string
    public func contains(_ other: String) -> Bool {
        return (self as NSString).contains(other)
    }
}
