//
//  UserDefaultsSettable.swift
//  TaxReader
//
//  Created by asdc on 2020/6/1.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import Foundation

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where defaultKeys.RawValue==String {
    static func set(value: String?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
}
