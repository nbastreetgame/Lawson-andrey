import Foundation

enum Api {
    case photos
    
    private var baseUrl: String {
        "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case.photos: return baseUrl + "/photos"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case.photos: return [.init(name: "client_id", value: "9TCpr2P21Imx1gK3C9rNEwkeEH1OOwHxLVIYivfwn_4")]
        }
    }
    
    var headers: [String: String] {
        switch self {
        case.photos: return["Accept-Version": "v1"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case.photos: return .get
        }
    }
}
