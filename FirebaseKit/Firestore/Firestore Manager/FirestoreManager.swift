//
//  FirestoreManager.swift
//  FirebaseKit
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation
import FirebaseFirestore

public struct FirestoreManager<T: Codable> {

    /// This function creates an instance of FirestoreManager.
    public init() {}

    /// This property is used to create requests.
    public let router = FirestoreRouter<FirestoreAPI<T>>()

    /// This typealias represents a completion handler used when retrieving decodable types from Firestore.
    public typealias FirestoreRequestResultCallback = (Result<T, Error>) -> Void

    /// This typealias represents a completion handler used when adding encodable types to Firestore.
    public typealias FirestoreDocumentReferenceResultCallback = (Result<DocumentReference, Error>) -> Void
}

// MARK: - Decode JSON
extension FirestoreManager {

    /// This function decodes a query snapshot in JSON format.
    /// This is used when there are array of items of the same decodable type.
    /// - Parameter querySnapshot: This is retrieved from Firestore after a query request has successfully completed.
    /// - Returns: This function returns a result type.
    ///            On success, this function returns an array of type T.
    ///            On failure, this function returns an Error.
    public func decodeQuerySnapshot(_ querySnapshot: QuerySnapshot) -> Result<T, Error> {
        let data = querySnapshot.documents.compactMap { (queryDocumentSnapshot) in
            queryDocumentSnapshot.data()
        }

        let result = Result<T, Error> { try JSONDecoder().decode(T.self, fromJSONObject: data) }

        return result
    }

    /// This function decodes a document snapshot in JSON format.
    /// This is used when there is one item retrieved of a decodable type.
    /// - Parameter documentSnapshot: This is retrieved from Firestore after a document request has successfully completed.
    /// - Returns: This function returns a result type.
    ///            On success, this function returns an instance of type T.
    ///            On failure, this function returns an Error.
    public func decodeDocumentSnapshot(_ documentSnapshot: DocumentSnapshot) -> Result<T, Error> {
        if let data = documentSnapshot.data() {
            return Result<T, Error> { try JSONDecoder().decode(T.self, fromJSONObject: data) }
        } else {
            return .failure(NSError())
        }
    }

}
