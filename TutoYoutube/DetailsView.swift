//
//  DetailsView.swift
//  TutoYoutube
//
//  Created by Abdoulaye Aliou SALL on 19/02/2023.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    let item: UserModel
    @State var prenom = ""
    @State var nom = ""
    @State var email = ""
    @State var motDePasse = ""
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Edit profile")
                    .font(Font.system(size: 16 , weight: .bold))
                
                TextField("prenom ", text: $prenom)
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
                .onAppear(perform:{
                        self.prenom = item.prenom
                        self.nom = item.nom
                        self.email = item.email
                        self.motDePasse = item.motDePasse
                    }
                )
        }
        .navigationBarTitle("Edit Post", displayMode: .inline)
        .navigationBarItems(trailing: trailing)
        
    }
    var trailing : some View {
        Button(action: {
            print("post")
            if prenom != "" && nom != "" && email != "" && motDePasse != "" {
                let parameters : [String :Any] = ["prenom":prenom , "nom":nom , "email": email, "motDePasse":motDePasse, "role":"user"]
                userViewModel.UpdatePost(parameters: parameters, id: item.id)
                print("fetch data")
                print(item.id)
                userViewModel.fetchPost()
                print("deja recuperer")
                userViewModel.fetchPost()
            }
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("save")
        })
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//"id":item.id,
//}
