//
//  QuestionsPresenter.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation

class QuestionsPresenter  {
    
    // MARK: Properties
    weak var view: QuestionsViewProtocol?
    var interactor: QuestionsInteractorInputProtocol?
    var wireFrame: QuestionsWireFrameProtocol?
    
}

extension QuestionsPresenter: QuestionsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getQuestions()
    }
}

extension QuestionsPresenter: QuestionsInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func onQuestionsFetched(questions: [QuestionForCell]) {
        view?.onQuestionsFetched(questions: questions)
    }
}
