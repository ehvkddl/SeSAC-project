//
//  Case3TableViewCell.swift
//  SeSACWeek3
//
//  Created by do hee kim on 2023/07/28.
//

import UIKit

protocol ButtonTappedDelegate: AnyObject {
    func favoriteButtonTapped(for cell: Case3TableViewCell)
}

class Case3TableViewCell: UITableViewCell {

    static let indentifier = "Case3TableViewCell"
    
    weak var delegate: ButtonTappedDelegate?
    
    var indexPath: IndexPath?
    
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var todo: UILabel!
    @IBOutlet weak var favoriteStar: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(row: Todo) {
        todo.text = row.todo
        
        let isDoneImage = UIImage(systemName: row.isDone ? "checkmark.square" : "square")
        checkBox.setImage(isDoneImage, for: .normal)
        
        let favoriteImage = UIImage(systemName: row.isFavorite ? "star.fill" : "star")
        favoriteStar.setImage(favoriteImage, for: .normal)
    }

    @IBAction func favoriteBtnClicked(_ sender: UIButton) {
        let currentCell = self
        delegate?.favoriteButtonTapped(for: currentCell)
    }
    
}
