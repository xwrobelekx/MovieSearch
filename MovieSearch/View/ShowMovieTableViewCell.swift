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
    
    let movieToDispaly: Movie? {
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
        
        
        
    }


}
