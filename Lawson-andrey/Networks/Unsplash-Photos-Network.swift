import Foundation

extension Network {
    
    //MARK: - Photos Unsplush
    
    func getPhotos(completion: @escaping (Result<[PhotoModel], Error>) -> ())  {
        let api = Api.photos
        pushRequest(api:api, type: [PhotoModel].self, completion: completion)
          
    }
    func downloadImage(url: URL, completion: @escaping (Result<Data, Error>) -> ())  {
        let task = URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                return
            }
            
            completion(.success(data))
        }
        task.resume()
        
    }
}
