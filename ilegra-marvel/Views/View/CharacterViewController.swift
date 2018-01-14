//
//  CharacterViewController.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    /**
     :nodoc:
     */
    @IBOutlet weak var imgCharacter: UIImageView!
    /**
     :nodoc:
     */
    @IBOutlet weak var nameCharacter: UILabel!
    /**
     :nodoc:
     */
    @IBOutlet weak var descCharacter: UILabel!
    /**
     :nodoc:
     */
    @IBOutlet weak var btnWebPage: UIButton!
    ///selectedCharacter Character character selecionado na lista
    var selectedCharacter: Character?
    /**
     :nodoc:
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        if let character = selectedCharacter{
            nameCharacter.text = character.name
            if let url = URL(string: character.thumbnail.getUrl()){
                imgCharacter.kf.indicatorType = .activity
                imgCharacter.kf.setImage(with: url)
            } else {
                imgCharacter.image = UIImage(named: "no_avatar")
            }
            descCharacter.text = !character.description.isEmpty ? character.description : "Personagem sem Descrição."
            if character.urls.count == 0{
                btnWebPage.isEnabled = false
                btnWebPage.setTitle("Personagem sem página", for: .disabled)
            }
        }
    }
    
    /**
     :nodoc:
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    /**
     :nodoc:
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webPageCharacterSegue"{
            let view = segue.destination as! WebPageCharacterViewController
            view.character = self.selectedCharacter
        }
    }
}
