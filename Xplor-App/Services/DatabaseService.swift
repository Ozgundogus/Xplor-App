//
//  DatabaseService.swift
//  Xplor-App
//
//  Created by Ozgun Dogus on 5.11.2023.
//

import Foundation
import FirebaseFirestore

protocol DatabaseServiceProtocol {
    func fetchPlaces (completion: @escaping (Result<[PlaceModel],FetchPlaceError>)-> Void )
}

class DatabaseService: DatabaseServiceProtocol {
    
    let database  = Firestore.firestore()
    
    func fetchPlaces (completion: @escaping (Result<[PlaceModel],FetchPlaceError>)-> Void ) {
        database.collection("places").order(by: "docID" , descending: false).getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.NetworkError))
            }
            
            guard let snapshot  = snapshot else {
                print ("error loading snaphsot")
                completion(.failure(.DataError))
                return
 }
            
            
            let documents = snapshot.documents
            var places = [PlaceModel]()
            for doc in documents {
                let data = doc.data()
                let name = data["name"] as? String ?? ""
                let category = data["category"] as? String ?? ""
                let imageURL = data["imageURL"] as? String ?? ""
                let docID = data["docID"] as? Int ?? 0
                
                let place = PlaceModel(name: name, category: category, imageURL: imageURL, docID: docID)
                places.append(place)
            }
            
            completion(.success(places))
//            print ( snapshot.documents.first?.data())
        }
    }
    
}
