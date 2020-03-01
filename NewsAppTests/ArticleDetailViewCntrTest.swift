//
//  ArticleDetailViewCntrTest.swift
//  NewsAppTests
//
//  Created by Toyaj Nigam on 01/03/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import XCTest
@testable import NewsApp

class ArticleDetailViewCntrTest: XCTestCase {
    var articleDetailViewCntr: ArticleDetailViewController!
     let mdlView: ArticleModelView = ArticleModelView()

    override func setUp() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
               articleDetailViewCntr = storyBoard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
               _ = articleDetailViewCntr.view
    }
    
    func testImageView() {
        XCTAssertNotNil(articleDetailViewCntr.ib_ImageView)
    }

}
