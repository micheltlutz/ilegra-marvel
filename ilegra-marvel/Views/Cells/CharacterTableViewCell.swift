//
//  CharacterTableViewCell.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with character: Character){
        nameCharacter.text = character.name
        if let url = URL(string: character.thumbnail.getUrl()){
            imgCharacter.kf.indicatorType = .activity
            imgCharacter.kf.setImage(with: url)
        } else {
            imgCharacter.image = UIImage(named: "no_avatar")
        }
        imgCharacter.layer.cornerRadius = imgCharacter.frame.size.height / 2
        imgCharacter.layer.borderColor = UIColor(hex: "545263").cgColor
    }
}
