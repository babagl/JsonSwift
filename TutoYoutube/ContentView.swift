//
//  ContentView.swift
//  TutoYoutube
//
//  Created by Abdoulaye Aliou SALL on 18/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct HomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var isPresentedNewPost = false
    @State var prenom = ""
    @State var nom = ""
    @State var email = ""
    @State var motDePasse = ""
    var body: some View {
        NavigationView {
            List{
                ForEach(userViewModel.users, id: \.id) { item in
                        NavigationLink(destination: DetailsView(item: item),
                                       label: {
                            VStack(alignment: .leading ) {
                                Text(item.prenom)
                                Text(item.role).font(.caption).foregroundColor(.gray)
                            }
                            
                        })

                    }
            }.listStyle(InsetListStyle())
            .navigationTitle("posts")
                .navigationBarItems(trailing: plusButton)
        }.sheet(isPresented: $isPresentedNewPost, content: {
            NewPostView(isPresented: $isPresentedNewPost, prenom: $prenom, nom: $nom, email: $email, motDePasse: $motDePasse)
        })
    }
    var plusButton: some View{
        Button(action: {
            print("holla")
            isPresentedNewPost.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
}



//    var HomeView: some View {
//        @State var isPresentedNewPost = false
//        @State var Prenom = ""
//        @State var nom = ""
//        @State var email = ""
//        @State var motDePasse = ""
//
//        NavigationView {
//            List {
//                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/, id: \.self) { item in
//                    NavigationLink(destination: Text("destination"),
//                                   label: {
//                        VStack(alignment: .leading) {
//                            Text("Navigate")
//                            Text("Hello, world!").font(.caption).foregroundColor(.gray)
//                        }
//
//                    })
//
//                }
//            }
//            .listStyle(InsetListStyle())
//            .navigationTitle("Posts")
//            .navigationBarItems(trailing: plusButton)
//        }
//        .sheet(isPresented: $isPresentedNewPost, content: {
//            NewPostView(isPresented: $isPresentedNewPost, Prenom: $Prenom, nom: $nom, email: $email, motDePasse: $motDePasse)
//        })
//
//
//    var plusButton: some View{
//        Button(action: {
//            isPresentedNewPost.toggle()
//        }, label: {
//            Image(systemName: "plus")
//        })
//    }
//    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
