//
//  MovieController.swift
//  MovieSearch
//
//  Created by Kamil Wrobel on 9/7/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit


class MovieController {
    
    static let shared = MovieController()
    
    private init(){}
    
    var fetchedMovies: [Movie] = []
    
    let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie?")
    
    let apiKey = "df27e0c0e10e50e785b375686ccc7895"
    
    
    func fetchMovie(movieTitle: String, completion: @escaping(_ success: Bool) -> Void) {
        
        guard let unwrappedURL = baseURL else {
            fatalError("Error unwraping base URL")
        }
        
        let buildURL = unwrappedURL
        var components = URLComponents(url: buildURL, resolvingAgainstBaseURL: true)
        
        let apiKey = URLQueryItem(name: "api_key", value: self.apiKey)
        let searchTerm = URLQueryItem(name: "query", value: movieTitle)
        
        components?.queryItems = [apiKey, searchTerm]
        
        
        guard let url = components?.url else {
            print("trouble unwraping full url")
            completion(false)
            return
        }
        
        print(url)
        
        /*
         searech term "Kamil Wrobel"
         printed URL: https://api.themoviedb.org/3/search/movie?api_key=df27e0c0e10e50e785b375686ccc7895&query=Kamil%20Wroebl
         sample: https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher
         
         search term: "Fight Club"
         printed URL: https://api.themoviedb.org/3/search/movie?api_key=df27e0c0e10e50e785b375686ccc7895&query=Fight%20Club
         -tested in browser - pullde out proper json file 🤓
         */
        
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("Error with URL Session: \(error), \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("No Data ☹️.")
                completion(false)
                return
            }
            
            
            //decode data?
            
            do {
                let decodedMovies = try JSONDecoder().decode([Movie].self, from: data)
                self.fetchedMovies = decodedMovies
                completion(true)
                
            } catch {
                print("After all this work here was an error Decoding 😡😡😡 \(#function): \(error), \(error.localizedDescription)")
                completion(false)
                return
            }
            
            }.resume()
        
    }
    
//
//    func fetchPosters(movie: Movie, completion: @escaping(UIImage?) -> Void){
//
//
//
//
//        URLSession.shared.dataTask(with: <#T##URL#>) { (data, _, error) in
//
//            URLSession.shared.dataTask(with: Movie.posterImage ) { (data, _, error) in
//
//                do{
//                    if let error = error {
//                        throw error
//                    }
//                    guard let data = data else { throw NSError()}
//                    let image = UIImage(data: data)
//                    completion(image)
//                }catch {
//                    print("There was an error on \(#function): \(error) \(error.localizedDescription)")
//                    completion(nil)
//                    return
//                }
//
//                }.resume()
//              }
//
    
            
            
            
            
}
        
        
        

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


