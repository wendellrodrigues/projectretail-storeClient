//
//  Api.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 12/29/20.
//

import Foundation
import Firebase
import FirebaseStorage

struct SessionModel: Codable {
    var beaconId: String
    var beaconMajor: String
    var beaconMinor: String
}


func getNearbyUsers(completion: @escaping(Array<UserBrief>) -> Void) -> Void {
    
    var nearbyUsers: Array<UserBrief> = []
    
    print("Beginning API Call")
    
    //URL Specifics
    guard let url = URL(string: "http:\(REQUEST_URL):3000/routes/getNearbyUsers") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/JSON", forHTTPHeaderField: "Accept")
    request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")

    //Structure data
    let infoToSend = SessionModel(
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
            print("Made API Call")
            completion(nearbyUsers)
        }
    }
    
    task.resume()

}

func getUser(completion: @escaping(User) -> Void) -> Void {
    
    //URL Specifics
    guard let url = URL(string: "http:\(REQUEST_URL):3000/routes/getNearbyUsers") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/JSON", forHTTPHeaderField: "Accept")
    request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")

    //Structure data
    let infoToSend = SessionModel(
        beaconId : BEACON_ID,
        beaconMajor : BEACON_MAJOR,
        beaconMinor: BEACON_MINOR
    )

    //Encode JSON
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    let jsonData = try! encoder.encode(infoToSend)
  
    request.httpBody = jsonData
    
}


func loadImage(completion: @escaping(UIImage) -> Void) -> Void {

    let gsRef = Ref.init().storage.reference(forURL: "gs://projectretail-4dd60.appspot.com/khakis.png")
    
    gsRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
        if let error = error {
            // Uh-oh, an error occurred!
        } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            completion((image ??  UIImage(systemName: "questionmark"))!)
        }
      }
}


