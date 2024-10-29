import Foundation

enum NetworkError: Error {
    
 case invalidURL
 case norData
 case error(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:      return "Invalid URL"
        case.norData:          return "Not data"
        case.error(let error): return error.localizedDescription
            
        }
    }
}

final class Network {
    
    static let shared = Network()
    
    private init() {
        
    }
    
    func pushRequest<T>(api: Api, httpBody: Data? = nil, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> ()) where T: Decodable {
        
        
        // 1 - URL
        guard let url = URL(string: api.path),
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            completion(.failure(.invalidURL))
            return }
        
        // 2 - Params
        
        urlComponents.queryItems = api.queryItems
        
        guard let path = urlComponents.url else {
            completion(.failure(.invalidURL))
            return
                       }
        
        var request = URLRequest(url: path,timeoutInterval: Double.infinity)
        
        
        // 3 - Headers
        api.headers.forEach { key,value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        // 4 - Method
        request.httpMethod = api.method.rawValue
        
        // 5 - Body
        request.httpBody = nil
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // если ошибка есть то отдаем сразу его
            if let error = error {
                completion(.failure(.error(error)))
                return
            }
            
            // рвботаем с данными
            guard let data = data else {
                completion(.failure(.norData))
                return
            }
            
            
        let decoder = JSONDecoder()
            
        do {
          let  object = try decoder.decode(T.self, from: data)
            
            completion(.success(object))
        }
        catch let faulura {
            print(faulura)
            completion(.failure(.norData))
            }
            
    }
        
        task.resume()
    }
}

