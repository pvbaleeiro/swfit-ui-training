//
//  FacebookView.swift
//  swift-ui-training
//
//  Created by Victor Baleeiro on 23/02/20.
//  Copyright © 2020 Victor Baleeiro. All rights reserved.
//

import SwiftUI

struct Post {
    var id: Int
    var username, text, imageName: String
}

struct FacebookView: View {
    
    let posts: [Post] = [
        .init(id: 0, username: "Victor Baleeiro", text: "Post body support auto sizing vertically and span multiple lines", imageName: "burger"),
        .init(id: 1, username: "Victor Baleeiro", text: "Post body support auto sizing vertically and span multiple lines", imageName: "post_puppy")
    ]
    
    var body: some View {
        NavigationView {
            List {
                VStack (alignment: .leading) {
                    ScrollView (.horizontal) {
                        VStack (alignment: .leading) {
                            Text("Trending")
                            HStack {
                                
                                NavigationLink.init(destination: GroupDetailView()) {
                                    GroupView()
                                }
                                GroupView()
                                GroupView()
                                GroupView()
                                GroupView()
                                GroupView()
                                GroupView()
                                GroupView()
                                GroupView()
                            }
                        }
                        
                    }.frame(height: 200)
                }
                
                // Post rows
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }.navigationBarTitle("Groups")
        }
    }
}

struct GroupDetailView: View {
    var body: some View {
        Text("GroupDetail VIEW!!!")
    }
}

struct GroupView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Image("hike").renderingMode(.original).cornerRadius(12)
            Text("Co-Ed Hikes of Colorado").foregroundColor(.primary).lineLimit(nil)
                .padding(.leading, 0)
        }.frame(width: 110, height: 170)
    }
}

struct PostView: View {
    
    let post: Post
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            
            HStack {
                Image(post.imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                
                VStack (alignment: .leading, spacing: 4) {
                    Text(post.username).font(.headline)
                    Text("Posted now").font(.subheadline)
                }.padding(.leading, 8)
                
            }.padding(.leading, 16).padding(.top, 16)
            
            Text(post.text).lineLimit(nil).padding(.leading, 16).padding(.trailing, 52)
            Image(post.imageName)
                .scaledToFill()
                .frame(height: 350)
                .clipped()
        }.padding(.leading, -20).padding(.bottom, -8)
    }
}

struct FacebookView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookView()
    }
}
