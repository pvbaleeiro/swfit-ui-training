//
//  StateManagementView.swift
//  swift-ui-training
//
//  Created by Victor Baleeiro on 24/02/20.
//  Copyright © 2020 Victor Baleeiro. All rights reserved.
//

import SwiftUI

struct StateManagementView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var users = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    VStack {
                        Group {
                            TextField("First Name", text: $firstName).padding(12)
                        }.background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(radius: 5)
                        
                        Group {
                            TextField("Last Name", text: $lastName).padding(12)
                        }.background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 5)

                        
                        Button(action: {
                            self.users.append("\(self.firstName) - \(self.lastName)")
                            self.firstName = ""
                            self.lastName = ""

                            }) {
                            Group {
                                Text("Create User").foregroundColor(.white).padding(12)
                            }.background(colorForButton())
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(radius: 5)
                        }.disabled(enableDisableButton())
                    }.padding(12)
                    
                }.background(Color.gray)
                
                List (users, id: \.self) {
                    Text($0)
                }
            }.navigationBarTitle(Text("Credit Card Form"))
                .navigationBarItems(leading: HStack {
                    Text("First name: ")
                    Text(firstName).foregroundColor(.red)
                    Text("Last name: ")
                    Text(lastName).foregroundColor(.red)
                })
        }
    }
    
    func enableDisableButton() -> Bool {
        if (firstName.count + lastName.count > 0) {
            return false
        }
        
        return true
    }
    
    func colorForButton() -> Color {
        if (firstName.count + lastName.count > 0) {
            return Color.blue
        }
        
        return Color.gray
    }
}

struct StateManagementView_Previews: PreviewProvider {
    static var previews: some View {
        StateManagementView()
    }
}
