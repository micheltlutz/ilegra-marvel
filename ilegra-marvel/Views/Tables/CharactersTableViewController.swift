//
//  CharactersTableViewController.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 CharactersTableViewController Table View controller para characters
 */
class CharactersTableViewController: UITableViewController {
    ///RequestCharacter
    let requestCharacter = RequestCharacter()
    ///DataSource de Character
    var characters: [Character] = []
    ///Flag indicativa de carregamento usada para endlessscroll
    var loadingCharacters = false
    ///Página atual usada para calculo do offset posteriormente
    var currentPage = 0
    ///Total de characters carregados
    var total = 0
    ///Armazena Character selecionado na tableView
    var selectedCharacter: Character? = nil
    
    ///UIActivityIndicatorView activityIndicator
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    /**
     :nodoc:
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        confifureNib()
        if characters.count == 0{
            self.initActivityIndicator()
        }
    }
    /**
     :nodoc:
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Activity Inticator
    /**
     Configura initActivityIndicator
     */
    func initActivityIndicator(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    // MARK: Config Nib
    /**
     Configura nib repo
     */
    fileprivate func confifureNib(){
        let nibName = UINib(nibName: "CharacterTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "characterCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 82
    }
    // MARK: - Load Data
    /**
     Carrega dados da Api atualiza itens da tabela e recarrega table
     */
    private func loadData(){
        loadingCharacters = true
        requestCharacter.loadCharacters(name: "",page: currentPage) { (response) in
            switch response {
            case .success(let model):
                self.total = model.data.total
                self.characters.append(contentsOf: model.data.results)
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.loadingCharacters = false
            case .serverError(let description):
                print("Server error: \(description) \n")
            case .noConnection(let description):
                print("Server error noConnection: \(description) \n")
            case .timeOut(let description):
                print("Server error timeOut: \(description) \n")
            }
        }
    }
    // MARK: - Table view data source
    /**
     :nodoc:
    */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    /**
     :nodoc:
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterTableViewCell
        cell.configureCell(with: characters[indexPath.row])
        return cell
    }
    /**
     Altura padrão da celula
     
     - Returns: 82.0 Float altura da celula
     */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.0
    }
    /**
     :nodoc:
     */
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        print("display row: \(indexPath.row)")
        if indexPath.row == (characters.count - 10) && !loadingCharacters && characters.count != total{
            currentPage += 1
            loadData()
        }
    }
 
    /**
     :nodoc:
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCharacter = self.characters[indexPath.row]
        self.performSegue(withIdentifier: "characterSegue", sender: nil)
    }
 
    // MARK: - Navigation
    /**
     :nodoc:
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterSegue"{
            let view = segue.destination as! CharacterViewController
            view.selectedCharacter = self.selectedCharacter
        }
    }
}
