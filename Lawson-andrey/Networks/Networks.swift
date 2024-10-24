import Foundation

final class Network {
    
    static let shared = Network()
    
    private init() {
        
    }
    
    
    func getPhotos(completion: @escaping (Result<[PhotoModel], Error>) -> ()) {
        var request = URLRequest(url: URL(string: "https://api.unsplash.com/photos/?client_id=9TCpr2P21Imx1gK3C9rNEwkeEH1OOwHxLVIYivfwn_4")!,timeoutInterval: Double.infinity)
        request.addValue("v1", forHTTPHeaderField: "Accept-Version")
       
        request.addValue("require_cookie_consent=false; un_sesh=dzc2dU96RVBkZXRyeDdwbGd0QllTUFN1MFpVR2hVNDNWTGFOanpuVWx6WEZNS2xaeXNaYzJOUGR1Y1NIaWl6UjN1OElqTmVzQ3l6dWF4RjF6UGhldHZlSUVnemgvTnlXK3M0QUowUjcyMUxOWkRhd2JNNlZjaHYrdnFlRi9MVnQrRk9NRVZFeFozYzlKUk9WS0p1WCtTTlhkaWpySEJjU0libVNPNWcrbzZwd1RqQkwrSzg5TzdpcjBNTHkzdFB6Y2ZkdWdyUVVmbzUxbjBLMnZMSUxXRlpHbk9NRmNNYTliQW9DVkdhZ3N4U2pqMlNJK1dWRGhhTE5xdkJ2enN3cnN6L29kbWtCMWpJRWM2YzhzTWNvWGpCUDhBbnVaaFNxYk9YZnJzWWZPSzA9LS1FN3prUDJoUXhaTUVzQUNLMEg2OGJRPT0%3D--4aee74fcdd0ae0549388cc7f641275d2f3e0c73f", forHTTPHeaderField: "Cookie")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            
            
        let decoder = JSONDecoder()
            guard let photos = try? decoder.decode([PhotoModel].self, from: data) else {
                return
            }
            
            completion(.success(photos))
            
            
          
        }

        task.resume()

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



