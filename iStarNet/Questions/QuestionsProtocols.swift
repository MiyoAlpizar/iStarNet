//
//  QuestionsProtocols.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation
import UIKit

protocol QuestionsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: QuestionsPresenterProtocol? { get set }
    
    func onQuestionsFetched(questions: [QuestionForCell])
}

protocol QuestionsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createQuestionsModule() -> UIViewController
}

protocol QuestionsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: QuestionsViewProtocol? { get set }
    var interactor: QuestionsInteractorInputProtocol? { get set }
    var wireFrame: QuestionsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol QuestionsInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func onQuestionsFetched(questions: [QuestionForCell])
}

protocol QuestionsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: QuestionsInteractorOutputProtocol? { get set }
    var localDatamanager: QuestionsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: QuestionsRemoteDataManagerInputProtocol? { get set }
    
    func getQuestions()
    
}

protocol QuestionsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol QuestionsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: QuestionsRemoteDataManagerOutputProtocol? { get set }
    
    func fetchQuestions()
}

protocol QuestionsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onQuestionsFetched(questions : QuestionResult)
}

protocol QuestionsLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
}

protocol QuestionsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: QuestionsLocalDataManagerOutputProtocol? { get set }
}
