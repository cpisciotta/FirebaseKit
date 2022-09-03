//
//  FirestoreConstants.swift
//  FirebaseKit
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation





public struct FirestoreQuery {
    let field: QueryField
    let value: Any
    let equalityType: EqualityType

    public init(field: QueryField, value: Any, equalityType: EqualityType) {
        self.field = field
        self.value = value
        self.equalityType = equalityType
    }

    public enum EqualityType {
        case isEqualTo
    }

    public struct QueryField {
        let name: String

        public init(name: String) {
            self.name = name
        }
    }
}
