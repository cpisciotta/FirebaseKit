//
//  FirestoreEncoder.swift
//  FirebaseKit
//
//  Created by Charles Pisciotta on 5/10/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation

struct FirestoreEncoder<EndPoint: FirestoreEndPointType> {

    /// This function encodes the EndPoint as JSON to add document(s).
    /// - Parameter route: The route specified for request.
    /// - Returns: Returns an array of JSON dictionary data.
    internal func getJSONInformation(from route: EndPoint) -> [String: Any] {
        switch route.firebaseTask {
        case .setData(let data):
            var dictionary = data.toDictionary()
            return dictionary
            //if !route.fields.isEmpty && route.fields.contains(where: { $0 == FirestoreFieldKey.userID }) {
            //    dictionary.updateValue(getUserID(), forKey: FirestoreFieldKey.userID.fieldKeyValue)
            //}

        default: fatalError("Set data not chosen as firebase task")
        }
    }
    
}
