//
//  Api.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 12/29/20.
//

import Foundation
import Firebase
import FirebaseStorage

//Request Structures
struct NearbyUserRequest: Codable {
    var beaconId: String
    var beaconMajor: String
    var beaconMinor: String
}

struct UserRequest: Codable {
    var userId: String
}

struct ShelfRequest: Codable {
    var beaconId: String
    var beaconMajor: String
    var beaconMinor: String
}

struct ShelfWithIdRequest: Codable {
    var uid: String
}

//POST Requests
func getNearbyUsers(completion: @escaping(Array<UserBrief>) -> Void) -> Void {
    
    var nearbyUsers: Array<UserBrief> = []
 
    //URL Specifics
    guard let url = URL(string: "http:\(REQUEST_URL):3000/routes/getNearbyUsers") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/JSON", forHTTPHeaderField: "Accept")
    request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")

    //Structure data
    let infoToSend = NearbyUserRequest(
        beaconId : BEACON_ID,
        beaconMajor : BEACON_MAJOR,
        beaconMinor: BEACON_MINOR
    )

    //Encode JSON
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    let jsonData = try! encoder.encode(infoToSend)
  
    request.httpBody = jsonData
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let data = data {
            let users: [UserBrief] = try! JSONDecoder().decode([UserBrief].self, from: data)
            for user in users { nearbyUsers.append(user) }
            completion(nearbyUsers)
        }
    }
    
    task.resume()

}

func getShelf(completion: @escaping(ShelfModel) -> Void) -> Void {
    
    //URL Specifics
    guard let url = URL(string: "http:\(REQUEST_URL):3000/routes/getShelf") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/JSON", forHTTPHeaderField: "Accept")
    request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")

    //Structure data for request
    let req = ShelfRequest(
        beaconId : BEACON_ID,
        beaconMajor : BEACON_MAJOR,
        beaconMinor: BEACON_MINOR
    )
    
    //Encode request
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let jsonData = try! encoder.encode(req)
    request.httpBody = jsonData
    
    //Task
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let data = data {
            let shelf: ShelfModel = try! JSONDecoder().decode(ShelfModel.self, from: data)
            completion(shelf)
        }
    }
    
    task.resume()
}


//For getting shelf just using a uid
func getShelfWithId(uid: String, completion: @escaping(ShelfModel) -> Void) -> Void {
    
    //URL Specifics
    guard let url = URL(string: "http:\(REQUEST_URL):3000/routes/getShelfWithId") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/JSON", forHTTPHeaderField: "Accept")
    request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")

    //Structure data for request
    let req = ShelfWithIdRequest(
        uid: uid
    )
    
    //Encode request
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let jsonData = try! encoder.encode(req)
    request.httpBody = jsonData
    
    //Task
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let data = data {
            let shelf: ShelfModel = try! JSONDecoder().decode(ShelfModel.self, from: data)
            print(shelf)
            completion(shelf)
        }
    }
    
    task.resume()
}

func getUser(uid: String, completion: @escaping(User) -> Void) -> Void {
    
    //URL Specifics
    guard let url = URL(string: "http:\(REQUEST_URL):3000/routes/getUser") else { return }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/JSON", forHTTPHeaderField: "Accept")
    request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
    
    //Structure data
    let req = UserRequest(userId: uid)

    //Encode JSON
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let jsonData = try! encoder.encode(req)
    request.httpBody = jsonData
    
    //Task
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let data = data {
            let user: User = try! JSONDecoder().decode(User.self, from: data)
            completion(user)
        }
    }
    
    task.resume()
}



//Load up an image on firebase
func loadFirebaseImage(url: String, completion: @escaping(UIImage) -> Void) -> Void {
    //Initial image
    var image = UIImage(systemName: "sun.min")!
    //Storage
    let storage = Storage.storage()
    // Create a reference from a Google Cloud Storage URI
    let gsReference = storage.reference(forURL: url)
    // Download in memory with a maximum allowed size of 2MB (2* 1024 * 1024 bytes)
    gsReference.getData(maxSize: 2 * 1024 * 1024) { data, error in
        if error != nil {
        completion(image)
      } else {
        // Data for "images/island.jpg" is returned
        image = UIImage(data: data!)!
        completion(image)
      }
    }
}


