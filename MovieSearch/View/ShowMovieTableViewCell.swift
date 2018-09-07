//
//  ShowMovieTableViewCell.swift
//  MovieSearch
//
//  Created by Kamil Wrobel on 9/7/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class ShowMovieTableViewCell: UITableViewCell {
    
    
    //MARK: - Properties
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieOverviewTextView: UITextView!
    
    
    
    var movieToDispaly: Movie? {
        didSet {
            
            updateViews()
        }
    }
    
    
    //MARK: - LifeCycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - Helper Methods
    
    func updateViews() {
        guard let movie = movieToDispaly else {return}
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "Rating: \(movie.rating)"
        movieOverviewTextView.text = movie.overview
        
        //FIXME: add image
        
    }
}
