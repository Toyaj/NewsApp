//
//  NYArticleModelTest.swift
//  NewsAppTests
//
//  Created by Toyaj Nigam on 01/03/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import XCTest
@testable import NewsApp

class NYArticleModelTest: XCTestCase {
    
    var articleInfo: NYArticleModel?
    var articleMdl: ArcticleDetails?
    
    override func setUp() {
        do {
            if let filePath = Bundle.init(for: NewsAppTests.self).path(forResource: "Articles", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
                do {
                    articleInfo = try JSONDecoder().decode(NYArticleModel.self, from: data as Data)
                    XCTAssertNotNil(articleInfo)
                } catch {
                    //Handle error
                }
            }
        }
    }
    
    func testNYArticleModel() {
       // let count = articleInfo?.results.count
        XCTAssertEqual(articleInfo?.results.count, 20)
    }
}
