//
//  CharacterViewController.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var nameCaracter: UILabel!
    
    var selectedCharacter: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let perso = selectedCharacter{
            print("Character",perso)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
