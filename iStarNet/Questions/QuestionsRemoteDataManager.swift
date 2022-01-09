//
//  QuestionsRemoteDataManager.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation

class QuestionsRemoteDataManager:QuestionsRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: QuestionsRemoteDataManagerOutputProtocol?
    
    func fetchQuestions() {
        APIService.shared.loadURLAndDecode(type: QuestionResult.self,url: Endpoints.Content.questions, params: nil) { result in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let questions):
                self.remoteRequestHandler?.onQuestionsFetched(questions: questions)
            }
            
        }
    }
    
}
