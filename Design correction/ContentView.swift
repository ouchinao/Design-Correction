//
//  ContentView.swift
//  Design correction
//
//  Created by 大内直 on 2024/03/04.
//

import SwiftUI
import SwiftData
import MobileCoreServices
import Combine

class SelectionManager: ObservableObject {
    @Published var selection: String?
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var selectionManager = SelectionManager()
    @State private var isSidebarOpen: Bool = false
    
    var body: some View {
        NavigationView() {
            List {
                NavigationLink(destination: HomeView(), tag: "home", selection: $selectionManager.selection) {
                    Label {
                        Text("Home")
                            .padding()
                            .cornerRadius(10)
                    } icon: {
                        Image(systemName: "house")
                    }
                }
                
                NavigationLink(destination: HistoryView(), tag: "history", selection: $selectionManager.selection) {
                    Label {
                        Text("History")
                            .padding()
                            .cornerRadius(10)
                    } icon: {
                        Image(systemName: "clock")
                    }
                }
                
                NavigationLink(destination: HelpView(), tag: "help", selection: $selectionManager.selection) {
                    Label {
                        Text("Help")
                            .padding()
                            .cornerRadius(10)
                    } icon: {
                        Image(systemName: "questionmark.circle")
                    }
                }
            }
            .onReceive(selectionManager.$selection) { newSelection in
                print("Received new selection: \(newSelection)")
                print("Received open: \(isSidebarOpen)")
                if isSidebarOpen{
                    withAnimation{
                        isSidebarOpen = false
                    }
                    withAnimation{
                        selectionManager.selection = nil
                    }
                }
            }
            HomeView()
        }
        .environmentObject(selectionManager)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
