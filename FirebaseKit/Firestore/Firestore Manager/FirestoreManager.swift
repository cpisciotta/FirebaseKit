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
    public typealias FirestoreRequestResultCallback = (Result<Decodable, Error>) -> Void

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
    public func decodeQuerySnapshot<Q>(_ querySnapshot: QuerySnapshot) -> Result<Q, Error> where Q: Decodable {
        let data = querySnapshot.documents.compactMap { (queryDocumentSnapshot) in
            queryDocumentSnapshot.data()
        }

        let result = Result<Q, Error> { try JSONDecoder().decode(Q.self, fromJSONObject: data) }

        return result
    }

    /// This function decodes a document snapshot in JSON format.
    /// This is used when there is one item retrieved of a decodable type.
    /// - Parameter documentSnapshot: This is retrieved from Firestore after a document request has successfully completed.
    /// - Returns: This function returns a result type.
    ///            On success, this function returns an instance of type T.
    ///            On failure, this function returns an Error.
    public func decodeDocumentSnapshot<D>(_ documentSnapshot: DocumentSnapshot) -> Result<D, Error> where D: Decodable {
        if let data = documentSnapshot.data() {
            return Result<D, Error> { try JSONDecoder().decode(D.self, fromJSONObject: data) }
        } else {
            return .failure(NSError())
        }
    }

}
