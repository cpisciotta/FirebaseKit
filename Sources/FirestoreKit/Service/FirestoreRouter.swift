//
//  FirestoreRouter.swift
//  
//
//  Created by Charles Pisciotta on 9/3/22.
//

import FirebaseFirestore
import Foundation

public struct FirestoreRouter {
    private let firestore = Firestore.firestore()

    init() { }

    // MARK: - GET

    public func getDocument(
        in collection: FirestoreCollection,
        named documentName: String
    ) async throws -> DocumentSnapshot {
        try await firestore
            .collection(collection.name)
            .document(documentName)
            .getDocument()
    }

    public func getAllDocuments(
        in collection: FirestoreCollection
    ) async throws -> QuerySnapshot {
        try await firestore
            .collection(collection.name)
            .getDocuments()
    }

    // MARK: - CREATE

    public func createDocument(
        in collection: FirestoreCollection,
        withData documentData: [String: Any]
    ) -> DocumentReference {
        firestore
            .collection(collection.name)
            .addDocument(data: documentData)
    }

    // MARK: - UPDATE

    public func updateDocument(
        in collection: FirestoreCollection,
        named documentName: String,
        fields: [AnyHashable: Any]
    ) async throws {
        try await firestore
            .collection(collection.name)
            .document(documentName)
            .updateData(fields)
    }

    // MARK: - DELETE

    public func deleteDocument(
        in collection: FirestoreCollection,
        named documentName: String
    ) async throws {
        try await firestore
            .collection(collection.name)
            .document(documentName)
            .delete()
    }
}
