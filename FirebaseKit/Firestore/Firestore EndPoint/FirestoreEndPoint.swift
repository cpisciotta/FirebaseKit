//
//  FirestoreEndPoint.swift
//  FirebaseKit
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation

public protocol FirebaseEndPoint {
    associatedtype T: Codable
    var collectionName: FirestoreCollectionName { get }
    var documentName: FirestoreDocumentName? { get }
    var firebaseTask: FirestoreTask<T> { get }
}
