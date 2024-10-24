import Foundation



// MARK: - WelcomeElement
struct PhotoModel: Codable {
    let id: String?
    let urls: Urls?
   
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

