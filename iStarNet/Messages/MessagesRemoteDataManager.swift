//
//  MessagesRemoteDataManager.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation

class MessagesRemoteDataManager:MessagesRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: MessagesRemoteDataManagerOutputProtocol?
    
    ///Fake service request
    func getMessages() {
        var messages = [Conversation]()
        messages.append(Conversation(fromUser: Users.darthVader,
                                     messages: [
                                        Message(uid: "2", message: "Join the dark side", date: Date().addingTimeInterval(-5000), seen: false),
                                        Message(uid: "1", message: "Join the dark side", date: Date().addingTimeInterval(-5500), seen: false),
                                     ])
        )
        
        messages.append(Conversation(fromUser: Users.yoda,
                                     messages: [
                                        Message(uid: "2", message: "No le hagas caso a Darth Vader", date: Date().addingTimeInterval(-5500), seen: true),
                                        Message(uid: "1", message: "Join the dark side", date: Date().addingTimeInterval(-5500), seen: true),
                                     ])
        )
        
        messages.append(Conversation(fromUser: Users.leia,
                                     messages: [
                                        Message(uid: "1", message: "Cuanto más fuerte cierre la mano, más sistemas estelares se le escaparan por los dedos. !Necesitamos actuar ya!", date: Date().addingTimeInterval(-6000), seen: false),
                                        Message(uid: "1", message: "Cuanto más fuerte cierre la mano, más sistemas estelares se le escaparan por los dedos. !Necesitamos actuar ya!", date: Date().addingTimeInterval(-6200), seen: false),
                                        Message(uid: "1", message: "Cuanto más fuerte cierre la mano, más sistemas estelares se le escaparan por los dedos. !Necesitamos actuar ya!", date: Date().addingTimeInterval(-6400), seen: false),
                                        Message(uid: "1", message: "Cuanto más fuerte cierre la mano, más sistemas estelares se le escaparan por los dedos. !Necesitamos actuar ya!", date: Date().addingTimeInterval(-6600), seen: false)
                                     ])
        )
        
        messages.append(Conversation(fromUser: Users.chewbacca,
                                     messages: [
                                        Message(uid: "1", message: "Gwaaaaaghhhh", date: Date().addingTimeInterval(-250000), seen: true)
                                     ])
        )
        
        messages.append(Conversation(fromUser: Users.ben,
                                     messages: [
                                        Message(uid: "1", message: "Hace mucho no escuchaba ese nombre", date: Date().addingTimeInterval(-450000), seen: false)
                                     ])
        )
        
        messages.append(Conversation(fromUser: Users.luke,
                                     messages: [
                                        Message(uid: "1", message: "Tu presunción es tu debilidad", date: Date().addingTimeInterval(-450000), seen: true)
                                     ])
        )
        
        messages.append(Conversation(fromUser: Users.hanSolo,
                                     messages: [
                                        Message(uid: "1", message: "Las religiones y las armas antiguas no son rival cuando tienes un buen blaster a tu lado, niño", date: Date().addingTimeInterval(-450000), seen: true)
                                     ])
        )

        let messagesForCell = messages.map({$0.toMessageForCell()})
        remoteRequestHandler?.onMessagesFetched(messages: messagesForCell)
        
    }
    
}
