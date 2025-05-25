//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Kiran Shrestha on 5/24/25.
//

import SwiftUI

struct UserDetailView: View {
    let user : User
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [.brown,.orange,.brown], center: .center, startRadius: 80, endRadius: 500)
            VStack {
                HStack{
                    Text("\(user.name) [\(user.age)]")
                        .font(.headline.weight(.bold))
                    Spacer()
                    Text("\(user.email)")
                }
                Text("\(user.about)")
                    .padding(5)
                VStack{
                    HStack{
                        Text("Friends:")
                        Spacer()
                        Text("\(user.friends.count)")
                    }
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(user.friends, id: \.id) { friend in
                                Text("\(friend.name) ")
                            }
                        }
                        .padding()
                    }
                    .background(.ultraThinMaterial)
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            
        }
    }
}

#Preview {
    UserDetailView(user: User(id: "testingID", isActive: false, name: "Test Person", age: 999, company: "None", email: "test@email.com", address: "123 address st", about: "about empty", registered: .now, tags: ["loud", "tester"],
                              friends: [Friend(id: "first", name: "Jim the First"),
                                        Friend(id: "second", name: "Grim the Second"),
                                        Friend(id: "third", name: "Kim the Third")
                                       ]))
}
