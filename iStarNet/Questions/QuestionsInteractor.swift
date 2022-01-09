//
//  QuestionsInteractor.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation

class QuestionsInteractor: QuestionsInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: QuestionsInteractorOutputProtocol?
    var localDatamanager: QuestionsLocalDataManagerInputProtocol?
    var remoteDatamanager: QuestionsRemoteDataManagerInputProtocol?

    func getQuestions() {
        remoteDatamanager?.fetchQuestions()
    }
}
extension QuestionsInteractor: QuestionsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func onQuestionsFetched(questions: QuestionResult) {
        presenter?.onQuestionsFetched(questions: questions.toQuestionsForCell())
    }
}

extension QuestionsInteractor: QuestionsLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
