//
//  APIService.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//

import Foundation

enum APIError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case seralizationError
    case noConnected
    var localizedDescription: String {
        switch self {
        case .apiError:
            return NSLocalizedString("Failed to fetch data", comment: "")
        case .invalidEndpoint:
            return NSLocalizedString("Invalid endpoint", comment: "")
        case .invalidResponse:
            return NSLocalizedString("Invalid response", comment: "")
        case .noData:
            return NSLocalizedString("No data", comment: "")
        case .seralizationError:
            return NSLocalizedString("Failed to decode data", comment: "")
        case .noConnected:
            return NSLocalizedString("There is not internet connection", comment: "")
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}


///Singleton class to make API requests with generic functions
class APIService {
    
    static var shared: APIService = APIService()
    
    private let apiKey = ""
    let baseAPIURL = ""
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder
   
   
    
    func loadURLAndDecode<D: Decodable>(type: D.Type,url: URL, params: [String: String]? = nil, completion: @escaping(Result<D, APIError>) -> ()) {
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        var _params = params
        if _params == nil {
            _params = ["language": Locale.current.languageCode ?? "en-US"]
        }
        
        if let params = _params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value)})
        }
        
        urlComponents.queryItems = queryItems
        
        guard  let finalUrl = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        print(finalUrl)
        urlSession.dataTask(with: finalUrl) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let error = error {
                completion(.failure(.apiError))
                print(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHanlderInMainThread(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionHanlderInMainThread(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decodedResponse = try self.jsonDecoder.decode(D.self, from: data)
                self.executeCompletionHanlderInMainThread(with: .success(decodedResponse), completion: completion)
            }catch {
                self.executeCompletionHanlderInMainThread(with: .failure(.seralizationError), completion: completion)
            }
            
        }.resume()

    }
    
    private func executeCompletionHanlderInMainThread<D: Decodable>(with result: Result<D, APIError>, completion: @escaping(Result<D, APIError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
