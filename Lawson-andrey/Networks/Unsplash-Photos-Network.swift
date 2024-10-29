import Foundation

extension Network {
    
    //MARK: - Photos Unsplush
    
    func getPhotos(completion: @escaping (Result<[PhotoModel], NetworkError>) -> ())  {
        let api = Api.photos
        pushRequest(api:api, type: [PhotoModel].self, completion: completion)
          
    }
    
    func searchPhotos(query: String,page: Int? = nil, perPage: Int? = nil, orderBy: String? = nil, completion: @escaping (Result<[PhotoModel], NetworkError>) -> Void) {
        let api = Api.searchPhotos(query: query, page: page, perPage: perPage, orderBy: orderBy)
        pushRequest(api: api, type: PhotoResponse.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    func downloadImage(url: URL, completion: @escaping (Result<Data, Error>) -> ())  {
        let task = URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.norData))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
        
    }
}
