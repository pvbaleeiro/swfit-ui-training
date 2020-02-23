//
//  ListDynamicView.swift
//  swift-ui-training
//
//  Created by Victor Baleeiro on 23/02/20.
//  Copyright © 2020 Victor Baleeiro. All rights reserved.
//

import SwiftUI

struct User: Identifiable, Hashable {
    var id: Int
    let username, message, imageName: String
}

struct ListDynamicView: View {
    
    let users: [User] = [
        .init(id: 0, username: "Victor Baleeiro", message: "iOS Developer", imageName: "victor_baleeiro"),
        .init(id: 1, username: "Vinicius Baleeiro", message: "Python Developer asndaijdijsadjjsadjsdjsjdiojioasjiodjaoisjoidjasdasodjojiojidjisjdijsjdjsijdijsijdisjdijsijdijsidjisjidjsijdijsijd212333333", imageName: "victor_baleeiro"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                Text("Users").font(.largeTitle)
                ForEach(users, id: \.self) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle("Dynamic List")
        }
    }
}

struct UserRow: View {
    
    let user: User
    var body: some View {
        // User row
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.orange, lineWidth: 3))
                .frame(width: 70, height: 70)
            VStack (alignment: .leading) {
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline)
                .lineLimit(nil)
            }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct ListDynamicView_Previews: PreviewProvider {
    static var previews: some View {
        ListDynamicView()
    }
}
