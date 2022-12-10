import Foundation
import SwiftUI

class ReleaseNotesViewModel: Fetchable, ObservableObject {
    @Published var note = VersionNotesModel(link: "", description: "")
    private var releaseNoteFilename: String
    
    init(releaseNoteFilename: String) {
        self.releaseNoteFilename = releaseNoteFilename
    }
    
    func getData() {
        Network.sendRequest(filename: releaseNoteFilename) { result in
           switch result {
           case .success(let data):
               do {
                   let decodedData = try JSONDecoder().decode(VersionNotesModel.self, from: data)
                   self.note.link = decodedData.link
                   self.note.description = decodedData.description
               } catch let err {
                   print(err)
               }
           case .failure(let failure):
               switch failure {
               case .connectionError:
                   print("Check your Internet connection.")
               default:
                   print("Unknown Error")
               }
           }
       }
    }
    
    
}
