import Foundation

enum Api {
    case photos
    case searchPhotos(query: String, page: Int?,perPage: Int?, orderBy: String?)
    
    private var baseUrl: String {
        "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case.photos: 
            return baseUrl + "/photos"
        case.searchPhotos:
            return baseUrl + "/search/photos"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case.photos: 
            return [.init(name: "client_id", value: "9TCpr2P21Imx1gK3C9rNEwkeEH1OOwHxLVIYivfwn_4")]
        case .searchPhotos(let query, let page, let perPage, let orderBy):
                   var items: [URLQueryItem] = [
                       .init(name: "client_id", value: "9TCpr2P21Imx1gK3C9rNEwkeEH1OOwHxLVIYivfwn_4"),
                       .init(name: "query", value: query)
                   ]
            if let page = page {
                           items.append(.init(name: "page", value: "\(page)"))
                       }
            if let perPage = perPage {
                           items.append(.init(name: "per_page", value: "\(perPage)"))
                       }
            if let orderBy = orderBy {
                           items.append(.init(name: "order_by", value: orderBy))
                       }
            return items
        }
    }
    
    var headers: [String: String] {
         return["Accept-Version": "v1"]
        }
    }
    
var method: HTTPMethod {
    switch self {
    case .photos, .searchPhotos:
        return .get
    }
}
