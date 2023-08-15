//
//  TmdbAPIManager.swift
//  TMDB
//
//  Created by do hee kim on 2023/08/11.
//

import Foundation
import Alamofire

class TmdbAPIManager {
    static let shared = TmdbAPIManager()
    private init() {}
    
    let headers: HTTPHeaders = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MmFhNTI3ZWZkYjIwZWI5OTlkY2VjMWJmYWE4NWM5NiIsInN1YiI6IjY0ZDEzNzBkZDhkMzI5MDExZTc0YmE0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.b02Ozt3Zntfjrhbw1uoEN-VJtaSF9zPxTkAG9gBIV78"
    ]
    
    let language = URLQueryItem(name: "language", value: "en")
    let apiKey = URLQueryItem(name: "api_key", value: "\(APIKey.tmdbKey)")
    
    func fetchTrend(completionHandler: @escaping (TreandResponse) -> Void) {
        var components = URLComponents(string: Endpoint.trending.requestURL)
        components?.queryItems = [language, apiKey]
        
        guard let url = components?.string else { return }

        AF.request(url, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let data = try JSONSerialization.data(withJSONObject: value)
                    let decodedData = try JSONDecoder().decode(TreandResponse.self, from: data)
                    
                    completionHandler(decodedData)
                } catch {
                    print("[decode fail]", error.localizedDescription)
                }
            case .failure(let error):
                print("ERROR", error)
            }
        }
    }
    
    func fetchCredit(movieID: Int, completionHandler: @escaping (Credit) -> Void) {
        var components = URLComponents(string: Endpoint.movie(movieID: movieID).requestURL)
        components?.queryItems = [language, apiKey]
        
        guard let url = components?.string else { return }
        
        AF.request(url, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let data = try JSONSerialization.data(withJSONObject: value)
                    let decodedData = try JSONDecoder().decode(Credit.self, from: data)
                    
                    completionHandler(decodedData)
                } catch {
                    print("[decode fail]", error.localizedDescription)
                }
            case .failure(let error):
                print("ERROR", error)
            }
        }
    }
    
    func fetchGenres(completionHandler: @escaping ([Genre]) -> Void) {
        var components = URLComponents(string: Endpoint.genre.requestURL)
        components?.queryItems = [language, apiKey]
        
        guard let url = components?.string else { return }
        
        AF.request(url, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let data = try JSONSerialization.data(withJSONObject: value)
                    let decodedData = try JSONDecoder().decode(Genres.self, from: data)
                    
                    completionHandler(decodedData.genres)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}