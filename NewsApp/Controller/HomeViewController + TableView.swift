//
//  HomeViewController + TableView.swift
//  NewsApp
//
//  Created by Toyaj Nigam on 29/02/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mdlView.totalArticleCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        cell.mdlView.model = mdlView.getArticleDetail(item: indexPath.row)
        cell.prepareForCell()
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleDetailCnt: ArticleDetailViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController)
        articleDetailCnt.mdlView.model = mdlView.getArticleDetail(item: indexPath.row)
        self.navigationController?.pushViewController(articleDetailCnt, animated: true)
    }
}
