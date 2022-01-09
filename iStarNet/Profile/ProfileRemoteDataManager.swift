//
//  ProfileRemoteDataManager.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//  
//

import Foundation

class ProfileRemoteDataManager:ProfileRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: ProfileRemoteDataManagerOutputProtocol?
    
    //Fake service request
    func getPosts() {
        var posts = [Post]()
       
        let hanPost = Post(user:iUser(id: "1", name: "Han Solo", imagePath: Images.Users.hanSolo),
                            date: Date(timeIntervalSinceNow: -500),
                            comments: "He recorrido esta galaxia de un extremo a otro, he visto cosas muy raras, pero nunca vi nada que me impulsara a creer que haya una única fuerza poderosa que lo controla todo. Ningún campo de energía mística controla mi destino. Todo eso no son más que leyendas y tonterías",
                            currentUserLiked: false,
                           likes: 8,
                           imageUrl:  Images.Users.hanSolo)
        
        
        let yodaPost = Post(user:iUser(id: "2", name: "Yoda", imagePath: Images.Users.yoda),
                            date: Date(timeIntervalSinceNow: -500),
                            comments: "El miedo es el camino hacia el Lado Oscuro. El miedo lleva a la ira, la ira lleva al odio, el odio lleva al sufrimiento. Percibo mucho miedo en ti",
                            currentUserLiked: true,
                            likes: 256,
                            imageUrl: "https://indiehoy.com/wp-content/uploads/2021/08/yoda-1200x675.jpg")
        
        
        let lukePost = Post(user:iUser(id: "3", name: "Luke Skywalker", imagePath: Images.Users.luke),
                            date: Date(timeIntervalSinceNow: -15500),
                            comments: "La fuerza es muy intensa en mi familia. Mi padre la tiene, yo la tengo y… Mi hermana la tiene. Eres tú, Leia.",
                            currentUserLiked: false,
                            likes: 24,
                            imageUrl: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bad-batch-darth-vader-1620378276.jpg?resize=640:*")
       
        let otherHanPost = Post(user:iUser(id: "4", name: "Han Solo", imagePath: Images.Users.hanSolo),
                            date: Date(timeIntervalSinceNow: -500),
                            comments: "La Fuerza, los Jedi, todo... Todo es verdad",
                            currentUserLiked: true,
                            likes: 54,
                           imageUrl:  "https://media.vandal.net/i/620x348/2-2021/202121112164514_3.jpg")
        
        
        let leaiPost = Post(user:iUser(id: "5", name: "Leia Skywalker", imagePath: Images.Users.leai),
                            date: Date(timeIntervalSinceNow: -84500),
                            comments: "No importa cuánto peleemos. Siempre he odiado verte ir",
                            currentUserLiked: true,
                            likes: 25,
                            imageUrl: nil)
        
        let chewbacca = Post(user:iUser(id: "6", name: "Chewbacca", imagePath: Images.Users.chewbacca),
                             date: Date(timeIntervalSinceNow: -84500),
                             comments: "Gwaaaaaghhhh",
                             currentUserLiked: true,
                             likes: 225,
                             imageUrl: nil)
    
        
        posts.append(hanPost)
        posts.append(chewbacca)
        posts.append(yodaPost)
        posts.append(leaiPost)
        posts.append(lukePost)
        posts.append(otherHanPost)
        
        
        
        
        let postsForCell = posts.map({$0.toPostForCell()})
        
        remoteRequestHandler?.onPostsFetched(posts: postsForCell)
        
    }
    
    func logOut() {
        
    }
}
