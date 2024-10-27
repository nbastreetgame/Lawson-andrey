import Foundation




final class Network {
    
    static let shared = Network()
    
    private init() {
        
    }
    
    func pushRequest<T>(api: Api, httpBody: Data? = nil, type: T.Type, completion: @escaping (Result<T, Error>) -> ()) where T: Decodable {
        
        
        // 1 - URL
        guard let url = URL(string: api.path),
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else { return }
        
        // 2 - Params
        
        urlComponents.queryItems = api.queryItems
        
        guard let path = urlComponents.url else { return }
        
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
               completion(.failure(error))
                return
            }
            
            // рвботаем с данными
            guard let data = data else {
                let newError = NSError(domain: api.path, code: 0, userInfo: [NSLocalizedDescriptionKey: "Not data from server"])
                completion(.failure(newError))
                return
            }
            
            
        let decoder = JSONDecoder()
            
        do {
            let object = try decoder.decode(T.self, from: data)
        }
        catch let faulura {
            print(faulura)
            completion(.failure(faulura))
            }
            
            
            
        }
        
        task.resume()
    }
}

