//
//  DataManager.swift
//  Demo
//
//  Created by Richa Mangukiya on 08/04/22.
//

import Foundation
import CoreData
import UIKit

open class DataManager: NSObject {
    
    public static let sharedInstance = DataManager()
    
    private override init() {}

    // Helper func for getting the current context.
    private func getContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }

    func retrieveUser() -> NSManagedObject? {
        guard let managedContext = getContext() else { return nil }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlayListData")
        
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            if result.count > 0 {
                // Assuming there will only ever be one User in the app.
                return result[0]
            } else {
                return nil
            }
        } catch let error as NSError {
            print("Retrieving user failed. \(error): \(error.userInfo)")
           return nil
        }
    }

    func saveList(_ book: Data) {
        guard let managedContext = getContext() else { return }
        guard let user = retrieveUser() else { return }

        user.setValue(book, forKey: "play")
        
        do {
            print("Saving session...")
            try managedContext.save()
            print("Saving session...")
            retrivePlayList()
        } catch let error as NSError {
            print("Failed to save session data! \(error): \(error.userInfo)")
        }
    }

    func retrivePlayList() {
        guard let managedContext = getContext() else { return }
        guard let user = retrieveUser() else { return }
        print(user.value(forKey: "play"))
        let decoder = JSONDecoder()
        if let loaded = try? decoder.decode(PlayList.self, from: user.value(forKey: "play") as! Data) {
            print(loaded)
        }
    }
}
