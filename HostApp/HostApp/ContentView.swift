//
//  ContentView.swift
//  HostApp
//
//  Created by Alvaro Barros on 03/09/23.
//

import SwiftUI
import Flutter

struct ContentView: View {
    @EnvironmentObject var flutterDependencies: FlutterDependencies
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Open hello_world") {
                print("Showing flutter!")
                showFlutter()
            }
        }
        .padding()
    }
    
    func showFlutter() {
        // Get the RootViewController.
        guard
          let windowScene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) as? UIWindowScene,
          let window = windowScene.windows.first(where: \.isKeyWindow),
          let rootViewController = window.rootViewController
        else { return }

        // Create the FlutterViewController.
        let flutterViewController = FlutterViewController(
          engine: flutterDependencies.flutterEngine,
          nibName: nil,
          bundle: nil)
        flutterViewController.modalPresentationStyle = .overCurrentContext
        flutterViewController.isViewOpaque = false

        rootViewController.present(flutterViewController, animated: true)
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
