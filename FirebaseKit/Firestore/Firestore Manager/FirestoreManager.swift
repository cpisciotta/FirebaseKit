//
//  FirestoreManager.swift
//  FirebaseKit
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation
import FirebaseFirestore

public struct FirestoreManager {

    /// This function creates an instance of FirestoreManager.
    public init() {}

    /// This property is used to create requests.
    public let router = FirestoreRouter<FirestoreAPI>()

    /// This typealias represents a completion handler used when retrieving decodable types from Firestore.
    public typealias FirestoreRequestResultCallback = (Result<Codable & Equatable, Error>) -> Void

    /// This typealias represents a completion handler used when adding encodable types to Firestore.
    public typealias FirestoreDocumentReferenceResultCallback = (Result<DocumentReference, Error>) -> Void
}
