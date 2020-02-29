//
//  ArticleCellModelView.swift
//  NewsApp
//
//  Created by Toyaj Nigam on 29/02/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import Foundation

class ArticleModelView {
    var model: ArcticleDetails?
    
    func getTitleOfArticle() -> String {
        return model?.title ?? ""
    }
    
    func getUpdatedArticleDate() -> String {
        return model?.updated ?? ""
    }
    
    func getPublishDate() -> String {
        return model?.publishedDate ?? ""
    }
    
    func getSectionName() -> String {
        guard  model?.section != "" else {
            return "No Data"
        }
        return model!.section
    }
    
    func getSubSectionName() -> String {
        guard  model?.subsection != "" else {
            return "No Data"
        }
        return model!.subsection
    }
    
    func getThumbnailImageURL() -> String? {
        guard model?.media.count ?? 0 > 0 else {
            return nil
        }
        guard let url = model?.media[0].mediaMetadata[0].url else {
            return nil
        }
        return  url
    }
    
    func getImageURL() -> String? {
        guard model?.media.count ?? 0 > 0 else {
            return nil
        }
        if model?.media[0].mediaMetadata.count ?? 0 > 2 {
            guard let url = model?.media[0].mediaMetadata[2].url else {
                return nil
            }
            return  url
        } else {
            guard let url = model?.media[0].mediaMetadata[0].url else {
                return nil
            }
            return  url
        }
    }
    
    func getDescriptionOFArticle() -> String {
        return model?.abstract ?? "Description not available"
    }
    
}
