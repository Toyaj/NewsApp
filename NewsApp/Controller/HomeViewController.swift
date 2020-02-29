//
//  ViewController.swift
//  NewsApp
//
//  Created by Toyaj Nigam on 29/02/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ib_tblView: UITableView!
    let mdlView: HomeModelView = HomeModelView()
    let networkManager: NetworkManager = NetworkManager()
    let imageCache = NSCache<NSString, UIImage>()
    let progressHUD = ProgressHud(text: "Processing...")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NY Times Most Popular"
        ib_tblView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        ib_tblView.tableFooterView = UIView()
        self.view.addSubview(progressHUD)
        getArticles()
    }
    
    func getArticles() {
        if Reachability.isConnectedToNetwork() {
            progressHUD.show()
            networkManager.getNYArticles(onSuccess: { (response) in
                self.mdlView.model = response
                DispatchQueue.main.async {
                    self.progressHUD.hide()
                    self.ib_tblView.reloadData()
                }
            }) {
                self.progressHUD.hide()
                let alert = UIAlertController(title: "Alert", message: "Please try after sometime", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "NY Times Most Popular"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
    }
    
    override func viewWillLayoutSubviews() {
        
        if !Reachability.isConnectedToNetwork() {
            let alert = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
