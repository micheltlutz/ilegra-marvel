//
//  CharacterTableViewCell.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCharacter: UIView!
    @IBOutlet weak var nameCharacter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with character: Character){
        nameCharacter.text = character.name
    }
}
