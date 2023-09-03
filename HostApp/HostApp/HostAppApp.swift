//
//  HostAppApp.swift
//  HostApp
//
//  Created by Alvaro Barros on 03/09/23.
//

import SwiftUI
import Flutter

class FlutterDependencies: ObservableObject {
   let flutterEngine = FlutterEngine(name: "dev.alvbarros.flutterengine")
   init(){
     // Runs the default Dart entrypoint with a default Flutter route.
     flutterEngine.run()
     // Connects plugins with iOS platform code to this app.
     // GeneratedPluginRegistrant.register(with: self.flutterEngine);
   }
 }

@main
struct HostAppApp: App {
    @StateObject var flutterDependencies = FlutterDependencies()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(flutterDependencies)
        }
    }
}
