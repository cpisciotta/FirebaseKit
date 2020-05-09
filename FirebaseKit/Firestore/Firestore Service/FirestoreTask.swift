//
//  FirestoreTask.swift
//  NV-Firebase-Kit-iOS
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation

/// An enum representation of the different Firestore task request types
public enum FirestoreTask<T: Codable> {

    /// Write data to the Firestore database
    case setData(_ data: T)

    /// Get data from the Firestore database
    case getData
}

