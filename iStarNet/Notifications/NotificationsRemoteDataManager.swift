//
//  NotificationsRemoteDataManager.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation

class NotificationsRemoteDataManager:NotificationsRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: NotificationsRemoteDataManagerOutputProtocol?
    
    func getNotifications() {
        var notificationsTypes = [NotificationTypeCell]()
        
        notificationsTypes.append(NotificationTypeCell(type: NotificationType.noti, data: NotificationForCell(icon: "heart.fill", message: "A Han Solo, Luke Skywalker , Leia y 8 más les ha gustado tu post", time: "09:23 am")))
        
        notificationsTypes.append(NotificationTypeCell(type: NotificationType.post, data: NotificationPostForCell(userName: "Darth Vader", userImage: URL(string: Images.Users.darthVader), detail: "Comentó recientemente", comment: "Eso espero comandante, por su propio bien. El Emperador no es tan magnánimo como yo", time: "09:24 pm")))
        
        notificationsTypes.append(NotificationTypeCell(type: NotificationType.post, data: NotificationPostForCell(userName: "Princess Leia", userImage: URL(string: Images.Users.leai), detail: "Buscó recomendaciones", comment: "¿Alguien sabe dónde está Alderan?", time: "11:32 pm")))
        
        
        notificationsTypes.append(NotificationTypeCell(type: NotificationType.noti, data: NotificationForCell(icon: "heart", message: "A Ben ya no le gusta tu foto", time: "09:23 am")))
        
        
        
        notificationsTypes.append(NotificationTypeCell(type: NotificationType.post, data: NotificationPostForCell(userName: "Yoda", userImage: URL(string: Images.Users.yoda), detail: "Publicó recomendaciones", comment: "El odio es una de las armas más poderosas de los Sith. Llevando a sus rivales a ese campo de incertidumbre, venganza y sentimientos viscerales, el Lado Oscuro se hace fuerte y es capaz de destruir a cualquiera que ose interponerse. Vader, al igual que Palpatine y otros antes, aprovecharon esa debilidad en los seres sensibles a la Fuerza. Algunos acabaron engrosando sus filas, pero otros tantos fueron derrotados al resistirse. Luke lo sabía e intentó mantenerse alejado de esa nube de sentimientos peligrosos en El retorno del Jedi. Él quería salvar a su padre.", time: "06:32 am")))
        
        
        notificationsTypes.append(NotificationTypeCell(type: NotificationType.noti, data: NotificationForCell(icon: "heart.fill", message: "A Luke Skywalker, Leia y 12 más les ha gustado tu post", time: "03:23 am")))
        
        
        remoteRequestHandler?.onNotificationsFetched(notifications: notificationsTypes)
        
    }
}
