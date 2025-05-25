//
//  ContentView.swift
//  FriendFace
//
//  Created by Kiran Shrestha on 5/24/25.
//

import SwiftUI

struct ContentView: View {
    @State var users : [User] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink("\(user.name)", value: user)
                }
            }
            .navigationDestination(for: User.self) { selection in
                UserDetailView(user: selection)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Sync Data", systemImage: "arrow.trianglehead.2.clockwise.rotate.90"){
                    Task {
                        do {
                            let apiUrl = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
                            let (data,_) = try await URLSession.shared.data(for: URLRequest(url: apiUrl))
                            
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .iso8601
                            
                            let decodedData = try decoder.decode([User].self, from: data)
                            
                            users = decodedData
                        }
                        catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
