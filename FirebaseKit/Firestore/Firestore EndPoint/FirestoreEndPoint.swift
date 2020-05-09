//
//  FirestoreEndPoint.swift
//  NV-Firebase-Kit-iOS
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation

public struct FirestoreAPI<T: Codable>: FirestoreEndPointType {

    internal let collectionName: FirestoreCollectionName

    internal let documentName: FirestoreDocumentName?

    internal let firebaseTask: FirestoreTask<T>

    public init(collectionName: FirestoreCollectionName,
                documentName: FirestoreDocumentName?,
                firebaseTask: FirestoreTask<T>) {
        self.collectionName = collectionName
        self.documentName = documentName
        self.firebaseTask = firebaseTask
    }
}
