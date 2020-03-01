//
//  ArticleTableViewCell.swift
//  NyTimes
//
//  Created by Toyaj Nigam on 29/02/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ib_ThumImgView: UIImageView!
    @IBOutlet weak var ib_TittleLabel: UILabel!
    @IBOutlet weak var ib_DateLabel: UILabel!
    @IBOutlet weak var ib_SectionLabel: UILabel!
    @IBOutlet weak var ib_SubSectionLabel: UILabel!
    var item: String?
    let mdlView: ArticleModelView = ArticleModelView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func prepareForCell() {
        ib_TittleLabel.text = mdlView.title
        ib_DateLabel.text = mdlView.publishDate
        ib_SectionLabel.text = mdlView.sectionName
        ib_SubSectionLabel.text = mdlView.subSectionName
        let imgURl = mdlView.thumnailUrl
        if imgURl != nil || imgURl != "" {
            self.setImage(url: imgURl ?? "")
        }
    }
    
    func setImage(url: String) {
        ib_ThumImgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"), options: [], completed: nil)
    }
}
