import Foundation
import SwiftUI

class VersionsViewModel: Fetchable, ObservableObject {
    @Published var versions = [VersionModel]()
    
     func getData() {
         Network.sendRequest(filename: "versions.json") { result in
            switch result {
            case .success(let data):
                do {
                    self.versions.append(contentsOf: try JSONDecoder().decode(VersionsModel.self, from: data).versions)
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
