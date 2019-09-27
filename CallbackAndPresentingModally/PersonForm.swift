//
//  PersonForm.swift
//  Layout SwiftUI
//
//  Created by Saif on 27/09/19.
//  Copyright © 2019 LeftRightMind. All rights reserved.
//

import SwiftUI

struct PersonForm: View {
    
    var didAddPerson: (Person) -> ()
    
    @Binding var isPresented: Bool
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var jobDesc: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            Text("Create Person")
                .fontWeight(.heavy)
                .font(.system(size: 32))
            
            HStack (spacing: 16) {
                Text("First Name")
                TextField("First Name", text: $firstName)
                    .padding(.all, 12)
                    .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(Color(.sRGB, red: 0.1, green: 0.1, blue: 0.1, opacity: 0.2)))
            }
            HStack (spacing: 16) {
                Text("Last Name")
                TextField("Last Name", text: $lastName)
                    .padding(.all, 12)
                    .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(Color(.sRGB, red: 0.1, green: 0.1, blue: 0.1, opacity: 0.2)))
            }
            
            HStack (spacing: 16) {
                Text("Job Description")
                TextField("Job Description", text: $jobDesc)
                    .padding(.all, 12)
                    .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(Color(.sRGB, red: 0.1, green: 0.1, blue: 0.1, opacity: 0.2)))
            }
            
            Button(action: {
                let person = Person(firstname: self.firstName, lastName: self.lastName, image: UIImage(named: "user")!, jobTitle: self.jobDesc)
                self.didAddPerson(person)
                self.isPresented = false
            }, label: {
                HStack {
                    Spacer()
                    Text("Add")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                    
                    Spacer()
                }
            })
            .background(Color.green)
            .cornerRadius(4)
            
            Button(action: {
                self.isPresented = false
            }, label: {
                HStack {
                    Spacer()
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                    
                    Spacer()
                }
            })
            .background(Color.red)
            .cornerRadius(4)
            
            Spacer()
            
        }.padding(.all, 20)
        
    }
}
//
//struct PersonForm_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonForm()
//    }
//}
