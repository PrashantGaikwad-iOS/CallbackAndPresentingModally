//
//  File.swift
//  Layout SwiftUI
//
//  Created by Saif on 27/09/19.
//  Copyright © 2019 LeftRightMind. All rights reserved.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let firstname: String
    let lastName: String
    let image: UIImage
    let jobTitle: String
}

struct UserList: View {
    
    @State private var isPresentingAddModel = false
    
    @State var people:[Person] = [
        .init(firstname: "Prashant", lastName: "G", image: #imageLiteral(resourceName: "user"), jobTitle: "ios developer"),
        .init(firstname: "Bhagyawant", lastName: "B", image: #imageLiteral(resourceName: "user"), jobTitle: "android developer"),
        .init(firstname: "Aman", lastName: "S", image: #imageLiteral(resourceName: "user"), jobTitle: "ios developer"),
        .init(firstname: "Swapnil", lastName: "N", image: #imageLiteral(resourceName: "user"), jobTitle: "android developer")
    ]
    
    var body: some View {
        NavigationView {
            List(people) { person in
                PersonRow(person: person) { (p) in
                    self.people.removeAll(where: {
                        $0.id == person.id
                    })
                }
            }
            .navigationBarTitle(Text("People"))
            .navigationBarItems(trailing: Button(action: {
                self.isPresentingAddModel.toggle()
            }, label: {
                Text("Add")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(Color.green)
                .cornerRadius(4)
            }))
            .sheet(isPresented: $isPresentingAddModel, content: {
                PersonForm(didAddPerson: { p in
                    self.people.append(p)
                }, isPresented: self.$isPresentingAddModel)
                    
            })
        }
    }
    
}



struct PersonRow: View {
    
    var person: Person
    var didDelete: (Person) -> ()
    
    var body: some View {
        HStack {
            Image(uiImage:person.image)
                .resizable()
                .scaledToFill()
                .frame(width:50,height:50)
                .overlay(RoundedRectangle(cornerRadius: 50)
                    .strokeBorder(style: StrokeStyle(lineWidth: 3))
                    .foregroundColor(Color.blue))
                .cornerRadius(60)
            
            VStack(alignment:.leading) {
                HStack(spacing: 16){
                    Text(person.firstname)
                    Text(person.lastName)
                }
                .font(.title)
                .foregroundColor(Color.primary)
                
                Text(person.jobTitle)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .layoutPriority(1)
            
            Spacer()
            
            Button(action: {
                self.didDelete(self.person)
            }, label: {
                Text("Delete")
                    .foregroundColor(.white)
                    .padding(.all,12)
                    .background(Color.red)
                    .cornerRadius(12)
            })
        }
    }
}



struct UserList_Previews: PreviewProvider {
    
    static var previews: some View {
        
        UserList()
        
    }
}
