//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Kamil Wrobel on 9/7/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

    }
    
    //MARK: - Helper method for search bar and loading
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search button pressed")
        
            self.navigationController?.title = searchBar.text
            self.loadMovies()
            self.searchBar.text = ""
            print("about resign")
            self.resignFirstResponder()
            print("resigned")
        
        
    }
    
    
    func loadMovies() {
        
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        MovieController.shared.fetchMovie(movieTitle: searchTerm) { (success) in
            if success {
                print("🤩🤩🤩🤩🤩🤩")
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            } else {
                print("😱😱😱😱😱😱")
            }
        }
    }
    
    



    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MovieController.shared.fetchedMovies.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? ShowMovieTableViewCell else { return UITableViewCell() }
        let movie = MovieController.shared.fetchedMovies[indexPath.row]
        
        cell.movieToDispaly = movie
        return cell
    }


 
}





















