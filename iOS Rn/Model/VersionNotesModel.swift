import Foundation

protocol VersionNotesProtocol {
    var link: String {get set}
    var description: String {get set}
}

struct VersionNotesModel: VersionNotesProtocol, Codable {
    var link: String
    var description: String
}
