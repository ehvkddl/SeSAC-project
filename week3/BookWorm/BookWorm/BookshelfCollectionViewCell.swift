//
//  BookshelfCollectionViewCell.swift
//  BookWorm
//
//  Created by do hee kim on 2023/07/31.
//

import UIKit

class BookshelfCollectionViewCell: UICollectionViewCell {

    @IBOutlet var moviePosterImageView: UIImageView!
    
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var runtimeAndRateLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        designCell()
    }

    func configureCell(row: Movie) {
        moviePosterImageView.image = UIImage(named: row.title)
        
        movieTitleLabel.text = row.title
        runtimeAndRateLabel.text = "\(row.runtime)분 | ⭐️\(row.rate)점"
        releaseDateLabel.text = "\(row.releaseDate) 개봉"
    }
    
    func designCell() {
        movieTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        releaseDateLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        releaseDateLabel.textColor = .gray
    }
    
}