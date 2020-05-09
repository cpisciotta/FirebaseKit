//
//  JSONDecoder+Ext.swift
//  NV-Firebase-Kit-iOS
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation

extension JSONDecoder {

    /// Decode a JSON object
    ///
    /// - Copyright: This function was found on Stack Overflow.
    ///
    /// https://stackoverflow.com/questions/53341137/using-decodable-to-get-the-object-and-document-id-with-firestore
    func decode<T>(_ type: T.Type, fromJSONObject object: Any) throws -> T where T: Decodable {
        return try decode(T.self, from: try JSONSerialization.data(withJSONObject: object, options: []))
    }
}
