//
//  FirestoreManager.swift
//  NV-Firebase-Kit-iOS
//
//  Created by Charles Pisciotta on 5/8/20.
//  Copyright © 2020 Charles Pisciotta. All rights reserved.
//

import Foundation
import FirebaseFirestore

public struct FirestoreManager<T: Codable> {

    private let router = FirestoreRouter<FirestoreAPI<T>>()

    public typealias FirestoreRequestResultCallback = (Result<Decodable, Error>) -> Void
    public typealias FirestoreDocumentReferenceResultCallback = (Result<DocumentReference, Error>) -> Void

//    func getUserTeams(completion: @escaping FirestoreRequestResultCallback) {
//        router.getDocuments(.getUserTeam) { (result) in
//            switch result {
//            case .failure(let err): completion(.failure(err))
//            case .success(let querySnapshot): completion(self.decodeQuerySnapshot(querySnapshot))
//            }
//        }
//    }
//
//    func setUserTeam(to team: T, completion: @escaping FirestoreDocumentReferenceResultCallback) {
//        router.addDocument(.setUserTeam(team: team)) { (result) in
//            completion(result)
//        }
//    }
//
//    func getUserGames(completion: @escaping FirestoreRequestResultCallback) {
//        router.getDocuments(.getUserGames) { (result) in
//            switch result {
//            case .failure(let error): completion(.failure(error))
//            case .success(let querySnapshot): completion(self.decodeQuerySnapshot(querySnapshot))
//            }
//        }
//    }
//
//    func addTeam(team: T, completion: @escaping(Result<DocumentReference, Error>) -> Void) {
//        router.addDocument(.addTeam(team: team)) { (result) in
//            completion(result)
//        }
//    }
//
//    func addGameInformation(gameInformation: T, completion: @escaping FirestoreDocumentReferenceResultCallback) {
//        router.addDocument(.addGameInformation(gameInformation: gameInformation)) { (result) in
//            completion(result)
//        }
//    }
//
//    func getTeams(completion: @escaping FirestoreRequestResultCallback) {
//        router.getDocuments(.getTeams) { (result) in
//            switch result {
//            case .failure(let error): completion(.failure(error))
//            case .success(let querySnapshot): completion(self.decodeQuerySnapshot(querySnapshot))
//            }
//        }
//    }
//
//    func addAtBat(atBat: T, completion: @escaping FirestoreDocumentReferenceResultCallback) {
//        router.addDocument(.addAtBat(atBat: atBat)) { (result) in
//            completion(result)
//        }
//    }
//
//    func getAtBats(for gameID: UUID, completion: @escaping FirestoreRequestResultCallback) {
//        router.getDocuments(.getAllAtBats(gameID: gameID)) { (result) in
//            switch result {
//            case .failure(let error): completion(.failure(error))
//            case .success(let querySnapshot): completion(self.decodeQuerySnapshot(querySnapshot))
//            }
//        }
//    }
//
//    func getAtBats(forInnning: Int, gameID: UUID, completion: @escaping FirestoreRequestResultCallback) {
//        router.getDocuments(.getAtBats(gameID: gameID, inning: forInnning)) { (result) in
//            switch result {
//            case .failure(let error): completion(.failure(error))
//            case .success(let querySnapshot): completion(self.decodeQuerySnapshot(querySnapshot))
//            }
//        }
//    }

//    func updateGameInformation(gameInformation: GameInformation, completion: @escaping (Error?) -> ()) {
//        router.updateField(.updateGameInformation(gameInformation: gameInformation), fields: [
//            "awayTeam": gameInformation.awayTeam,
//            "awayTeamScore": gameInformation.awayTeamScore,
//            "dateTime": gameInformation.dateTime,
//            "homeTeam": gameInformation.homeTeam,
//            "homeTeamScore": gameInformation.homeTeamScore,
//            "id": gameInformation.id,
//            "location": gameInformation.location,
//            "numInnings": gameInformation.numInnings]) { (error) in
//                completion(error)
//        }
//    }

//    func updateInning(gameID: UUID, inning: Int, completion: @escaping (Error?) -> Void) {
//        router.updateField(.updateInning(gameID: gameID), fields: [FirestoreFieldKey.numInnings.fieldKeyValue: inning]) { (error) in
//            completion(error)
//        }
//    }

    private func decodeQuerySnapshot<T: Codable>(_ querySnapshot: QuerySnapshot) -> Result<T, Error> {
        let data = querySnapshot.documents.compactMap { (queryDocumentSnapshot) in
            queryDocumentSnapshot.data()
        }

        let result = Result<T, Error> {
            return try JSONDecoder().decode(T.self, fromJSONObject: data)
        }

        return result
    }
}
