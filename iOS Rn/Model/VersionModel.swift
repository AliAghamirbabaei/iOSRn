import Foundation

protocol VersionProtocol {
    var versionName: String { get set }
    var link: String { get set }
}

protocol VersionsProtocol {
    var versions: [VersionModel] {get set}
}


struct VersionModel: VersionProtocol, Codable, Hashable {
    var version_name: String
    var versionName: String {
        get {
            return version_name
        }
        
        set {
            version_name = newValue
        }
    }
    var link: String
    var url: String {
        get {
            return link
        }
        
        set {
            link = newValue
        }
    }
}

struct VersionsModel: VersionsProtocol, Codable {
    var versions: [VersionModel]
}
