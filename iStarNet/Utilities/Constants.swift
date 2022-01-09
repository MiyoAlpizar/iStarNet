//
//  Constants.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import Foundation

struct FirebaseConstants {
    struct Collections {
        static let users = "Users"
    }
    
    struct Storages {
        static let users = "Users"
    }
}

struct Images {
    struct Users {
        
        static let yoda = "https://static.wikia.nocookie.net/esstarwars/images/d/d6/Yoda_SWSB.png/revision/latest?cb=20180105191224"
        
        static let hanSolo = "https://media.vandal.net/i/620x348/2-2021/202121112164514_2.jpg"
        
        static let miyo = "https://scontent.ftlc2-1.fna.fbcdn.net/v/t39.30808-6/247425996_10160180194928949_3993712646241811956_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeEER9jGzwffKbqNnPW5D1lDLtSYMGPQOZgu1JgwY9A5mBV6-B1QtVD-ZVRH_02WtVk&_nc_ohc=IjOmuU4mpuIAX-mdy5O&_nc_ht=scontent.ftlc2-1.fna&oh=00_AT9MrE6iCOSex7JVd87kAtZA-s695HCQpFMr5UKSm4bksw&oe=61CB356A"
        
        static let luke = "https://static.wikia.nocookie.net/esstarwars/images/d/d9/Luke-rotjpromo.jpg/revision/latest/scale-to-width-down/350?cb=20071214134433"
        
        static let leai = "https://static.wikia.nocookie.net/esstarwars/images/f/f3/Leia.jpg/revision/latest?cb=20140323045004"
        
        static let chewbacca = "https://static.wikia.nocookie.net/esstarwars/images/5/51/Chewbacca_TLJ.PNG/revision/latest/top-crop/width/360/height/450?cb=20190419143715"
        
        static let darthVader = "https://depor.com/resizer/3EbNN_NZdYzmjFuu7hrpg4oeu8w=/1200x800/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/Z7B7S4BVSZFJFPCI5Z4TZI7GQM.jpg"
        static let ben = "https://www.cinemascomics.com/wp-content/uploads/2020/07/serie-kenobi-star-wars.jpg"
    }
}

struct Users {
    static let yoda = iUser(id: "0", name: "yoda", imagePath: Images.Users.yoda)
    static let darthVader = iUser(id: "1", name: "Darth Vader", imagePath: Images.Users.darthVader)
    static let hanSolo = iUser(id: "2", name: "Han Solo", imagePath: Images.Users.hanSolo)
    static let luke = iUser(id: "3", name: "Like Skywalker", imagePath: Images.Users.luke)
    static let leia = iUser(id: "4", name: "Leia Skywalker", imagePath: Images.Users.leai)
    static let ben = iUser(id: "5", name: "Obi-Wan Kenobi", imagePath: Images.Users.ben)
    static let chewbacca = iUser(id: "6", name: "Chewbacca", imagePath: Images.Users.chewbacca)
}

struct Utils {
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        return dateFormatter
    }()
}

struct Endpoints {
    struct Content {
        static let questions: URL = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")!
    }
}
