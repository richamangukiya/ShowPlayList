//
//  PlayListViewModel.swift
//  Demo
//
//  Created by Richa Mangukiya on 08/04/22.
//

import Foundation

class PlayListViewModel {
    
    static func getPlayList(completion: @escaping (PlayList) -> Void) {
        ConnectionManager.callPlayListAPI { result, error in
            print(result)
            do {
                let data = try result.rawData()
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(PlayList.self, from: data)
                UserDefaults.standard.set(data, forKey: UserDefaultKeys.playList)
                completion(responseModel)
            } catch {
            }
        }
    }
}
