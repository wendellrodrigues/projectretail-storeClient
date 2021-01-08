//
//  Api.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 12/29/20.
//

import Foundation

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
