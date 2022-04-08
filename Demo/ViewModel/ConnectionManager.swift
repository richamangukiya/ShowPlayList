//
//  ConnectionManager.swift
//  Demo
//
//  Created by Richa Mangukiya on 08/04/22.
//

import Foundation
import SwiftyJSON
//import SwiftyJSON

class ConnectionManager {
    
    static func callPlayListAPI(completion: @escaping ( _ result: JSON, _ error : Error?) -> Void) -> Void {
        let url = URL(string: "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data1, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data1!) as! Dictionary<String, Any>
                completion(JSON(json), error)
            } catch {
                print("error")
                completion(JSON([]), error)
            }
        })

        task.resume()
    }
}
