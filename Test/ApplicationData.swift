//
//  ApplicationData.swift
//  Test
//
//  Created by David Norris on 15/11/2022.
//

import SwiftUI
import CoreData

class ApplicationData: ObservableObject {
   let container: NSPersistentCloudKitContainer

   static var preview: ApplicationData = {
      let model = ApplicationData(preview: true)
      return model
   }()
   init(preview: Bool = false) {
      container = NSPersistentCloudKitContainer(name: "Test")
      if preview {
         container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
      }
      container.viewContext.automaticallyMergesChangesFromParent = true
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
         if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
         }
      })
   }
}
