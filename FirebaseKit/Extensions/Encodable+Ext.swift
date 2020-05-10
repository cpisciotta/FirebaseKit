//
//  Encodable+Ext.swift
//  FirebaseKit
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation

extension Encodable {

    /// Encode JSON conforming type to dictionary format
    ///
    /// - Copyright: This function was found on Stack Overflow.
    ///
    /// https://stackoverflow.com/questions/45209743/how-can-i-use-swift-s-codable-to-encode-into-a-dictionary
    public func toDictionary() -> Result<[String: Any], Error> {
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
