import Foundation

protocol connectable {
    static var baseUrl: String { get }
    static func sendRequest(filename: String, completion: @escaping (Result)->Void)
}

enum Result {
    case success(Data)
    case failure(RequestError)
}

enum RequestError: Error {
    case unknownError
    case connectionError
    case serverError
}

struct Network: connectable {
    static var baseUrl = "https://kgaswnrmowkuzytjnhgt.supabase.co/storage/v1/object/public/data/"
        
 
     static func sendRequest(filename: String, completion: @escaping (Result)->Void) {
                
        var urlRequest = URLRequest(url: URL(string: baseUrl + filename)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("DEBUG: An error occurred: \(error)")
                completion(Result.failure(.connectionError))
            } else if let data = data ,let responseCode = response as? HTTPURLResponse {
                switch responseCode.statusCode {
                case 200:
                    completion(Result.success(data))
                case 500...599:
                    completion(Result.failure(.serverError))
                default:
                    completion(Result.failure(.unknownError))
                    break
                }
            }
        }.resume()
    }
}
