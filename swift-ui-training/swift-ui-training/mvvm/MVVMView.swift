//
//  MVVMView.swift
//  swift-ui-training
//
//  Created by Victor Baleeiro on 24/02/20.
//  Copyright © 2020 Victor Baleeiro. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

struct Course: Identifiable, Decodable {
    
    let id = UUID()
    let name: String
}

class CoursesViewModel: ObservableObject {
    
    @Published var messages = "Messages inside observable object"
    @Published var courses: [Course] = [
        .init(name: "Course 1"),
        .init(name: "Course 2"),
        .init(name: "Course 3")
    ]
    
    func changeMessage() {
        self.messages = "BLA BLA BLA"
    }
    
    func fetchCourses() {
        // fetch json and decode and update some array property
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            // make sure to check error / resp
            DispatchQueue.main.async {
                self.courses = try! JSONDecoder().decode([Course].self, from: data!)
            }
        }.resume()
    }
}

struct MVVMView: View {
    
    @ObservedObject var coursesViewModel = CoursesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(coursesViewModel.messages)
                
                ForEach(coursesViewModel.courses) { course in
                    Text(course.name)
                }
                
            }.navigationBarTitle("Courses")
                .navigationBarItems(trailing: Button(action: {
                    print("Fetching json data")
                    
                    self.coursesViewModel.fetchCourses()
                }, label: {
                    Text("Fetch courses")
                }))
        }
    }
}

struct MVVMView_Previews: PreviewProvider {
    static var previews: some View {
        MVVMView()
    }
}
