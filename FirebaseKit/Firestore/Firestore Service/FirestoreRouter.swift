//
//  FirestoreRouter.swift
//  NV-Firebase-Kit-iOS
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation
//import FirebaseFirestore
//import FirebaseAuth
//
//final class FirestoreRouter<EndPoint: FirestoreEndPointType> {
//
//    func getDocument(_ route: EndPoint, completion: @escaping (Result<DocumentSnapshot, Error>) -> Void) {
//        buildDocumentRequest(from: route).getDocument { (docSnap, error) in
//            if let error = error {
//                completion(.failure(error))
//            } else if let docSnap = docSnap {
//                completion(.success(docSnap))
//            } else {
//                fatalError("No Error and docSnap nil")
//            }
//        }
//    }
//
////    func updateField(_ route: EndPoint, fields: [AnyHashable: Any], completion: @escaping (Error?) -> Void) {
////        let docRef: DocumentReference = buildDocumentRequest(from: route)
////
////        docRef.updateData(fields) { (error) in
////            completion(error)
////        }
////    }
////
////    func addDocument(_ route: EndPoint, completion: @escaping (Result<DocumentReference, Error>) -> Void) {
////        let docRef = buildDocumentRequest(from: route)
////
////        let dictionaryData: [String: Any] = getJSONInformation(from: route)
////
////        docRef.setData(dictionaryData) { (error) in
////            if let error = error {
////                completion(.failure(error))
////            } else {
////                completion(.success(docRef))
////            }
////        }
////    }
////
////    func getDocuments(_ route: EndPoint, completion: @escaping (Result<QuerySnapshot, Error>) -> Void) {
////        var query: Query = buildCollectionRequest(from: route)
////
////        route.fields.forEach { (key) in
////            switch key {
////            case .userID:
////                query = query.whereField(FirestoreFieldKey.userID.fieldKeyValue, isEqualTo: getUserID())
////            case .gameID(let gameID):
////                query = query.whereField(FirestoreFieldKey.gameID(gameID: gameID).fieldKeyValue,
////                                         isEqualTo: gameID.uuidString)
////            case .inning(let inning):
////                query = query
////                    .whereField(FirestoreFieldKey.inning(inning: inning).fieldKeyValue, isEqualTo: inning)
////                    .order(by: FirestoreFieldKey.sequenceNumber.fieldKeyValue)
////            case .isUsersTeam:
////                query = query.whereField(FirestoreFieldKey.isUsersTeam.fieldKeyValue, isEqualTo: true)
////            default: fatalError("Cannot determine value for key: \(key)")
////            }
////        }
////
////        query.getDocuments { (querySnapshot, error) in
////            if let error = error {
////                completion(.failure(error))
////            } else if let querySnapshot = querySnapshot {
////                completion(.success(querySnapshot))
////            }
////        }
////    }
//
//    private func buildDocumentRequest(from route: EndPoint) -> DocumentReference {
//        let firestoreDB: Firestore = Firestore.firestore()
//
//        let collectionName = route.collectionName.name
//
//        let documentName = route.documentName?.name
//
//        if let documentName = documentName {
//            return firestoreDB.collection(collectionName).document(documentName)
//        } else {
//            return firestoreDB.collection(collectionName).document()
//        }
//    }
//
////    fileprivate func buildCollectionRequest(from route: EndPoint) -> CollectionReference {
////        let firebaseDB: Firestore = Firestore.firestore()
////
////        let collectionName = route.collectionName.rawValue
////        return firebaseDB.collection(collectionName)
////    }
////
////    fileprivate func getUserID() -> String {
////        if let user = Auth.auth().currentUser {
////            return user.uid
////        } else {
////            fatalError("Expected user, but no user was found.")
////        }
////    }
//
//    private func getJSONInformation(from route: EndPoint) -> [String: Any] {
//        switch route.firebaseTask {
//        case .setData(let data):
//            do {
//                var dictionary = try data.toDictionary().get()
//
////                if !route.fields.isEmpty && route.fields.contains(where: { $0 == FirestoreFieldKey.userID }) {
////                    dictionary.updateValue(getUserID(), forKey: FirestoreFieldKey.userID.fieldKeyValue)
////                }
//
//                return dictionary
//            } catch {
//                fatalError(error.localizedDescription)
//            }
//        default: fatalError("Set data not chosen as firebase task")
//        }
//    }
//
//}
//
