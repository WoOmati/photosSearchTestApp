import Foundation

class SearchPhotosServise {
    
    private let networkService = NetworkService()
    private let baseURL = "https://api.unsplash.com/search/photos/?client_id=3JL6v0JaQpuH42ia9exByDm8zwVuCbdFXeTH6mQr4pA&query="
    
    func obtainPhotos(phrase: String, response: @escaping (SearchResponse?) -> Void) {
        
        guard let photosURL = URL(string: baseURL + phrase) else { return }
        networkService.request(url: photosURL) { (result) in
            switch result {
            case .success(let data):
                do {
                    let images = try JSONDecoder().decode(SearchResponse.self, from: data)
                    response(images)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
    func obtainImage(from url: URL, response: @escaping (Data?) -> Void) {
            networkService.request(url: url) { result in
                switch result {
                case .success(let data): response(data)
                case .failure: response(nil)
                }
            }
        }
    
}
