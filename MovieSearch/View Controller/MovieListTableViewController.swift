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
    
            self.loadMovies()
         self.navigationController?.title = self.searchBar.text
        navigationController?.title = searchBar.text
        
    }
    
    
    func loadMovies() {
        
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        MovieController.shared.fetchMovie(movieTitle: searchTerm) { (success) in
            if success {
                print("🤩🤩🤩🤩🤩🤩")
                DispatchQueue.main.async {
                    // i had those in the searchBarButtonClicked() - but it still doesnt work
                   
                    // this one works
                    self.searchBar.text = ""
                    // this one doesnt
                    self.resignFirstResponder()
                    //not this one was here and it works
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





















