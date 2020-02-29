//
//  HomeModelView.swift
//  NewsApp
//
//  Created by Toyaj Nigam on 29/02/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import Foundation

class HomeModelView {
    
    var model: [ArcticleDetails]?
    
    var totalArticleCount: Int {
        getTotalArticleCount()
    }
    
    func getTotalArticleCount() -> Int {
        return model?.count ?? 0
    }
    
    func getArticleDetail(item: Int) -> ArcticleDetails? {
        
        return model?[item]
    }
}
