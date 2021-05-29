//
//  FirestoreRouter.swift
//  FirebaseKit
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth // TODO: Remove?

public final class FirestoreRouter<EndPoint: FirebaseEndPoint> {}

// MARK: - ADD Document(s)
extension FirestoreRouter {
    public func addDocument(_ route: EndPoint, completion: @escaping (Result<DocumentReference, Error>) -> Void) {
        let docRef = buildDocumentRequest(from: route)

        let dictionaryData = FirestoreEncoder().getJSONInformation(from: route)

        docRef.setData(dictionaryData) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(docRef))
            }
        }
    }
}


// MARK: - GET Document(s)
extension FirestoreRouter {
    public func getDocument(_ route: EndPoint, completion: @escaping (Result<DocumentSnapshot, Error>) -> Void) {
        buildDocumentRequest(from: route).getDocument { (docSnap, error) in
            if let error = error {
                completion(.failure(error))
            } else if let docSnap = docSnap {
                completion(.success(docSnap))
            } else {
                fatalError("No Error and docSnap nil")
            }
        }
    }

    public func getDocuments(_ route: EndPoint, completion: @escaping (Result<QuerySnapshot, Error>) -> Void) {
        var query: Query = buildCollectionRequest(from: route)

        route.queryFields?.forEach { queryField in
            switch queryField.equalityType {
            case .isEqualTo: query = query.whereField(queryField.field.name, isEqualTo: queryField.value)
            }
        }

        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else if let querySnapshot = querySnapshot {
                completion(.success(querySnapshot))
            } else {
                fatalError()
            }
        }
    }
}


// MARK: - Delete Document
extension FirestoreRouter {
    public func deleteDocument(_ route: EndPoint, completion: @escaping (Error?) -> Void) {
        buildDocumentRequest(from: route).delete { error in
            completion(error)
        }
    }
}


// MARK: - Build Request
extension FirestoreRouter {
    private func buildDocumentRequest(from route: EndPoint) -> DocumentReference {
        let firestoreDB: Firestore = Firestore.firestore()

        let collectionName = route.collectionName.name

        let documentName = route.documentName?.name

        if let documentName = documentName {
            return firestoreDB.collection(collectionName).document(documentName)
        } else {
            return firestoreDB.collection(collectionName).document()
        }
    }

    private func buildCollectionRequest(from route: EndPoint) -> CollectionReference {
        let firebaseDB: Firestore = Firestore.firestore()

        let collectionName = route.collectionName.name

        return firebaseDB.collection(collectionName)
    }
}
