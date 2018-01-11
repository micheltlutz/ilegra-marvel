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
    
    let requestPage = RequestPage()
    
    var page: Page?
    
    var characters: [Character] = []
    
    var resultCount = 0
    
    var pageCounter = 1
    
    var selectedCharacter: Character?
    
    ///UIActivityIndicatorView activityIndicator
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    /**
     :nodoc:
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(page: pageCounter)
        confifureNib()
        if resultCount == 0{
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
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
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
    private func loadData(page: Int){
        requestPage.getDataPage(page: String(pageCounter)){ (response) in
            switch response {
            case .success(let model):
                self.page = model
                self.characters.append(contentsOf: model.results)
                self.resultCount += model.results.count
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    /**
     :nodoc:
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultCount
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
        if indexPath.row == (resultCount - 1) {
            pageCounter += 1
            loadData(page: pageCounter)
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
