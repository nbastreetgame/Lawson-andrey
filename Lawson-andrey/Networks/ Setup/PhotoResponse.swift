import Foundation


struct PhotoResponse: Decodable {
    let total: Int
    let totalPages: Int
    let results: [UnsplashPhotoModel]
    
    enum CodingKeys: String, CodingKey {
          case total
          case totalPages = "total_pages"
          case results
      }
}

struct UnsplashPhotoModel: Decodable {
    let id: String
    let createdAt: String
    let width: Int
    let height: Int
    let color: String
    let description: String?
    let user: User
    let urls: PhotoUrls

    struct User: Decodable {
        let id: String
        let username: String
        let name: String
        let profileImage: ProfileImage

        enum CodingKeys: String, CodingKey {
            case id, username, name
            case profileImage = "profile_image"
        }

        struct ProfileImage: Decodable {
            let small: String
            let medium: String
            let large: String
        }
    }

    struct PhotoUrls: Decodable {
        let raw: String
        let full: String
        let regular: String
        let small: String
        let thumb: String
    }
}


