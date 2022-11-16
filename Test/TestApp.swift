//
//  TestApp.swift
//  Test
//
//  Created by David Norris on 15/11/2022.
//

import SwiftUI

@main
struct TestApp: App {
   @StateObject var appData = ApplicationData()
   
   var body: some Scene {
      WindowGroup {
         ContentView()
            .environment(\.managedObjectContext, appData.container.viewContext)
      }
   }
}
