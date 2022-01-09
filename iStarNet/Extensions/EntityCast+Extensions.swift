//
//  EntityCast+Extensions.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import UIKit


extension Post {
    
    ///Cast Post into Post for showing in cell data
    func toPostForCell() -> PostForCell {
        var post: PostForCell!
        if #available(iOS 15.0, *) {
             post = PostForCell(userName: self.user.name,
                                   userImage: nil,
                                   date: self.date.formatted(),
                                   comments: self.comments,
                                   currentUserLiked: self.currentUserLiked,
                                   likes: "\(likes) likes",
                                   imageUrl: nil)
        } else {
             post = PostForCell(userName: self.user.name,
                                   userImage: nil,
                                date: self.date.description,
                                   comments: self.comments,
                                   currentUserLiked: self.currentUserLiked,
                                   likes: "\(likes) likes",
                                   imageUrl: nil)
        }
        
        if let url = self.user.imagePath {
            post.userImage = URL(string: url)
        }
        
        if let url = self.imageUrl {
            post.imageUrl = URL(string: url)
        }
        return post
        
    }
}

extension Conversation {
    
    ///Cast Message into Message for showing in cell data
    func toMessageForCell() -> MessageForCell {
        var message = MessageForCell(imageURL: nil,
                                     userName: self.fromUser.name,
                                     preview: self.messages.map({$0.message}).first ?? "",
                                     newMessages: self.messages.filter({$0.seen == false}).count,
                                     timeAgo: "")
        if let image = self.fromUser.imagePath {
            message.imageURL = URL(string: image)
        }
        let timeAgo = self.messages.map({$0.date}).first
        if let timeAgo = timeAgo {
            // ask for the full relative date
            if #available(iOS 13.0, *) {
                let formatter = RelativeDateTimeFormatter()
                formatter.unitsStyle = .short
                // get exampleDate relative to the current date
                let relativeDate = formatter.localizedString(for: timeAgo, relativeTo: Date())
                message.timeAgo = relativeDate
            } else {
                // Fallback on earlier versions
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                message.timeAgo = formatter.string(from: timeAgo)
            }
            
        }
        
        return message
    }
}


extension QuestionResult {
    
    ///Cast Questions into Questions for showing in cell data
    func toQuestionsForCell() -> [QuestionForCell] {
        var questions = [QuestionForCell]()
        var indexColor = 0
        for i in 0..<self.questions.count {
            var responses = [QuestionResponseForCell]()
            for j in 0..<self.questions[i].chartData.count {
            
                if indexColor >= self.colors.count {
                    indexColor = 0
                }
                let color = UIColor.init(hex: self.colors[indexColor])
                indexColor += 1
                responses.append(QuestionResponseForCell(
                    data: self.questions[i].chartData[j].text,
                    value: self.questions[i].chartData[j].percetnage,
                    color: color ?? UIColor.blue))
            }
            
            let question = QuestionForCell(question: self.questions[i].text, responses: responses)

            questions.append(question)
        }
        
        return questions
    }
}
