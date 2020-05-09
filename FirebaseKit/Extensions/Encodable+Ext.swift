//
//  Encodable+Ext.swift
//  NV-Firebase-Kit-iOS
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation

extension Encodable {
    func toDictionary() -> Result<[String: Any], Error> {
        do {
            let jsonData = try JSONEncoder().encode(self)

            guard let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] else {
                return .failure(NSError())
            }

            return .success(dictionary)
        } catch {
            return .failure(error)
        }
    }
}
