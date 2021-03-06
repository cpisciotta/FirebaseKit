//
//  FirestoreAPI.swift
//  FirebaseKit
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation

public struct FirestoreAPI<T: Codable>: FirebaseEndPoint {

    public let collectionName: FirestoreCollectionName

    public let documentName: FirestoreDocumentName?

    public let firebaseTask: FirestoreTask<T>

    public var queryFields: [FirestoreQuery]?

    public init(collectionName: FirestoreCollectionName,
                documentName: FirestoreDocumentName?,
                firebaseTask: FirestoreTask<T>,
                queryFields: [FirestoreQuery]? = nil) {
        self.collectionName = collectionName
        self.documentName = documentName
        self.firebaseTask = firebaseTask
        self.queryFields = queryFields
    }
}
