//
//  ArticleDetailViewController.swift
//  NewsApp
//
//  Created by Toyaj Nigam on 29/02/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    let mdlView: ArticleModelView = ArticleModelView()
    @IBOutlet weak var ib_ImageView: UIImageView!
    @IBOutlet weak var ib_TittleLabel: UILabel!
    @IBOutlet weak var ib_SectionSubSectionLabel: UILabel!
    @IBOutlet weak var ib_ArticleDescLabel: UILabel!
    @IBOutlet weak var ib_PublishDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Article Details"
        self.updateUI()
    }
}

extension ArticleDetailViewController {
    
    func updateUI() {
        ib_TittleLabel.text = mdlView.getTitleOfArticle()
        ib_SectionSubSectionLabel.text = "\(mdlView.getSectionName()), \(mdlView.getSubSectionName())"
        ib_PublishDateLabel.text = mdlView.getPublishDate()
        ib_ArticleDescLabel.text = mdlView.getDescriptionOFArticle()
        let imgURl = mdlView.getImageURL()
        if imgURl != nil {
            self.setImage(url: imgURl!)
        }
    }
    
    func setImage(url: String) {
        ib_ImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"), options: [], completed: nil)
    }
}
