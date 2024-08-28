import Foundation

enum NetworkServiceError: Error {
    case failedData
    case failedToCreateRequest
    case badStatusCode
}

final class NetworkService {

    static let shared = NetworkService()
    private init() {}
    
    private let boundary = "Boundary-\(UUID().uuidString)"
    private let lineBreak = "\r\n"
    private var body = Data()
    private let url = URL(string: "https://test.rozentalgroup.ru/version2/entry.php")!
    
    public func setAuthFields(login: String, password: String) -> Data {
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition:form-data; name=\"service[0][name]\"")
        body.append("\(lineBreak+lineBreak+"login"+lineBreak)")
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition:form-data; name=\"service[0][attributes][login]\"")
        body.append("\(lineBreak+lineBreak+"\(login)"+lineBreak)")
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition:form-data; name=\"service[0][attributes][password]\"")
        body.append("\(lineBreak+lineBreak+"\(password)"+lineBreak)")
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition:form-data; name=\"service[1][name]\"")
        body.append("\(lineBreak+lineBreak+"customer_navbar"+lineBreak)")
        body.append("--\(boundary + lineBreak)")
        body.append("\(lineBreak+lineBreak+"private"+lineBreak)")
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }
    
    public func setDashboardFields() -> Data {
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition:form-data; name=\"service[0][name]\"")
        body.append("\(lineBreak+lineBreak+"customer_dashboard"+lineBreak)")
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition:form-data; name=\"service[1][name]\"")
        body.append("\(lineBreak+lineBreak+"my_profile"+lineBreak)")
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition:form-data; name=\"service[2][name]\"")
        body.append("\(lineBreak+lineBreak+"my_new_notifications"+lineBreak)")
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition:form-data; name=\"service[2][attributes][mode]\"")
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }

    // MARK: - MOK DATA: login = "test_user", password = "123456aB"
    
    public func generateAuthRequest<T: Codable>(
        expecting type: T.Type,
        login: String,
        password: String,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let loginString = String(format: "%@:%@", login, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.httpBody = setAuthFields(login: "test_user", password: "123456aB")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NetworkServiceError.failedData))
                return
            }
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    public func generateDashboardRequest<T: Codable>(
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = setDashboardFields()
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NetworkServiceError.failedData))
                return
            }
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
