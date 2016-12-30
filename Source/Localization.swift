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
            let table = key.substring(to: textRange.lowerBound)
            dict[key] = table
            return table
        }
        
        return ""
    }
}

@IBDesignable
open class OXLocalizableLabel: UILabel {
    
    @IBInspectable
    public var localizationKey: String?
    
    open override func awakeFromNib() {
        super.awakeFromNib()

        if let text = localizationKey {
            self.text = text.localized()
        }
    }
}

@IBDesignable
open class OXLocalizableButton: UIButton {
    
    @IBInspectable
    public var localizationKey: String?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if let text = localizationKey {
            setTitle(text.localized(), for: .normal)
        }
    }
}



public extension String {
    
    /// Localizae string
    public func localized() -> String {
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
