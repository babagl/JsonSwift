//
//  NewPostView.swift
//  TutoYoutube
//
//  Created by Abdoulaye Aliou SALL on 18/02/2023.
//

import SwiftUI

struct NewPostView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var isPresented : Bool
    @Binding var prenom :String
    @Binding var nom :String
    @Binding var email :String
    @Binding var motDePasse :String
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("new profile")
                        .font(Font.system(size: 16 , weight: .bold))
                    
                    TextField("Prenom ", text: $prenom)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    
                    TextField("Nom", text: $nom)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    
                    TextField("email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    
                    TextField("Mot de Passe", text: $motDePasse)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    
                    Spacer()
                    
                }.padding()
                    .alert(isPresented: $isAlert, content: {
                        let prenom = Text("no data")
                        let nom = Text("Please")
                        let email = Text("Please")
                        let motDePasse = Text("Please")
                        return Alert(title: prenom,message: nom)
                    })
            }
            .navigationBarTitle("new Post", displayMode: .inline)
            .navigationBarItems(leading: leading, trailing: trailing)
        }
    }
    
    var leading : some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("cancel")
        })
    }
    
    var trailing : some View {
        Button(action: {
            if prenom != "" && nom != "" && email != "" && motDePasse != "" {
                let parameters : [String :Any] = ["prenom":prenom , "nom":nom , "email": email, "motDePasse":motDePasse, "role":"user"]
                
                userViewModel.createPost(parameters: parameters)
                print("fetch data")
                userViewModel.fetchPost()
                print("deja recuperer")
                isPresented.toggle()
                userViewModel.fetchPost()
                
            }else{
                isAlert.toggle()
            }
        }, label: {
            Text("post")
        })
    }
}

//struct NewPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPostView()
//    }
//}
