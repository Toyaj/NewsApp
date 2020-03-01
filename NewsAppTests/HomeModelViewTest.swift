//
//  HomeModelViewTest.swift
//  NewsAppTests
//
//  Created by Toyaj Nigam on 01/03/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import XCTest
@testable import NewsApp

class HomeModelViewTest: XCTestCase {
    var articleInfo: NYArticleModel?
    let mdlView: HomeModelView = HomeModelView()
    var articleMdl: ArcticleDetails?

    override func setUp() {
         do {
                 if let filePath = Bundle.init(for: NewsAppTests.self).path(forResource: "Articles", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
                     do {
                         articleInfo = try JSONDecoder().decode(NYArticleModel.self, from: data as Data)
                         mdlView.model = articleInfo?.results
                         XCTAssertNotNil(articleInfo)
                     } catch {
                         //Handle error
                     }
                 }
             }
    }
    
    func testgetTotalArticleCount() {
           let totalcount = mdlView.getTotalArticleCount()
           XCTAssertEqual(20, totalcount)
       }
       
       func testtotalArticleCount() {
           let count = mdlView.totalArticleCount
           XCTAssertEqual(20, count)
       }
       
       func testModel() {
           mdlView.model = articleInfo?.results
           XCTAssertNotNil(mdlView.model)
       }
      
       func testgetArticleDetail() {
           let value: Int = 0
           let arcticleDetails: ArcticleDetails = (mdlView.model?[value])!
           let articleDtl = mdlView.getArticleDetail(item: value)
           XCTAssertEqual(articleDtl?.assetID, arcticleDetails.assetID)
      }

}
