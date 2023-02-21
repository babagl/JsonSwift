//
//  UserViewModel.swift
//  TutoYoutube
//
//  Created by Abdoulaye Aliou SALL on 18/02/2023.
//

import Foundation
import SwiftUI


class UserViewModel: ObservableObject {
    @Published var users:[UserModel] = []
    let prefixeUrl = "http://localhost:3000/api/users"
    
    init(){
        fetchPost()
    }
    
    
    //Galle : Retreive data
    func fetchPost(){
        print("func retreive data")
        guard let url = URL(string: prefixeUrl) else { return print("url non trouvei") }
        URLSession.shared.dataTask(with: url){(data, res, error) in
            let responseComplete = res as? HTTPURLResponse
            if error != nil{
                print("error", error?.localizedDescription)
                print(responseComplete)
                return
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode([UserModel].self, from: data)
                    DispatchQueue.main.async {
                        self.users = result
                        print(responseComplete)
                    }
                }
            }catch let JsonError{
                print("fetch json error ", JsonError.localizedDescription)
                print(responseComplete)
            }
        }.resume()
    }
    
    
    
    //Galle : New  data
    func createPost(parameters : [String : Any]){
        guard let url = URL(string: prefixeUrl) else { return print("url non trouvei") }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request){(data, res, error) in
            if error != nil{
                print("error", error?.localizedDescription)
                return
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode([UserModel].self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                        self.users = result 
                    }
                }
            }catch let JsonError{
                print("fetch json error ", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    func ConnexionPost(parameters : [String : Any]){
        guard let url = URL(string: prefixeUrl) else { return print("url non trouvei") }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request){(data, res, error) in
            if error != nil{
                print("error", error?.localizedDescription)
                return
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode([UserModel].self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                        self.users = result
                    }
                }
            }catch let JsonError{
                print("fetch json error ", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    
    //Galle : update   data
    func UpdatePost(parameters : [String : Any], id :Int){
        print("mon id ====== \(id)")
        guard let url = URL(string: "http://localhost:3000/api/users/\(id)") else { return print("url non trouvei") }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){(data, res, error) in
            if error != nil{
                print("error", error?.localizedDescription)
                return
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(UserModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }
            }catch let JsonError{
                print("fetch json error ", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    
    
    //Galle : Delete data
    func deletePost(parameters : [String : Any], id:Int){
        guard let url = URL(string: "\(prefixeUrl)/\(id)") else { return print("url non trouvei") }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){(data, res, error) in
            if error != nil{
                print("error", error?.localizedDescription)
                return
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(UserModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }
            }catch let JsonError{
                print("fetch json error ", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    
}
