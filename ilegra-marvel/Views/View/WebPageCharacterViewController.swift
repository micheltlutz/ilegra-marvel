//
//  WebPageCharacterViewController.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 13/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit
import WebKit

class WebPageCharacterViewController: UIViewController {
    
    var character: Character!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\n\nURLSSS \n\n",character.urls)
        let url = URL(string: character.urls.first!.url)
        let request = URLRequest(url: url!)
        title = character.name
        
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.load(request)
    }
}

extension WebPageCharacterViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
