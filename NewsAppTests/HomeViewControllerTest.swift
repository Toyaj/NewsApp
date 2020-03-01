//
//  HomeViewControllerTest.swift
//  NewsAppTests
//
//  Created by Toyaj Nigam on 01/03/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import XCTest
@testable import NewsApp

class HomeViewControllerTest: XCTestCase {
    
    var homeViewCntr: HomeViewController!
    let mdlView: HomeModelView = HomeModelView()
    let networkManager: NetworkManager = NetworkManager()
    var articleInfo: NYArticleModel?
    var articleMdl: ArcticleDetails?
    
    override func setUp() {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        homeViewCntr = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        _ = homeViewCntr.view
        homeViewCntr.ib_tblView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        XCTAssertNotNil(homeViewCntr.ib_tblView)
        XCTAssertNotNil(homeViewCntr.ib_tblView.tableFooterView)
        XCTAssertNotNil(homeViewCntr.progressHUD)
        XCTAssertEqual(homeViewCntr.title, "NY Times Most Popular")
        
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
    
    func testLoadViewSetsTablDataSource() {        XCTAssertTrue(homeViewCntr.ib_tblView?.dataSource is HomeViewController)
    }
    
    func testLoadViewSetsTablDelegate() {
        XCTAssertTrue(homeViewCntr.ib_tblView?.delegate is HomeViewController)
    }
    
    func testDataSourceDelegateSameInstance() {
        XCTAssertEqual(homeViewCntr.ib_tblView?.dataSource as! HomeViewController, homeViewCntr.ib_tblView.delegate as! HomeViewController)
    }
    
    func testgetArticles() {
        XCTAssertNotNil(homeViewCntr.getArticles())
    }
    
    func testNetworkManager() {
        XCTAssertNotNil(homeViewCntr.networkManager)
    }
    
    func testArticleAPICall() {
        XCTAssertNotNil(homeViewCntr.networkManager.getNYArticles(onSuccess: { (response) in
            XCTAssertNotNil(response)
        }, onFailure: {
        }))
    }
    
    func testNumberOFRowInSection() {
        let count = homeViewCntr.ib_tblView.numberOfRows(inSection: 0)
        XCTAssertNotEqual(count, 20)
    }
    
    func testCellForRowAtIndex() {
        let value: Int = 0
        let actualCell = homeViewCntr.ib_tblView.dataSource?.tableView(homeViewCntr.ib_tblView, cellForRowAt: IndexPath(row: 0, section: 0))
        guard let cell = actualCell as? ArticleTableViewCell else {
            XCTFail("Expected \(ArticleTableViewCell.self), but was \("actualCell" ?? "ArticleTableViewCell")")
             return
        }
        cell.mdlView.model = mdlView.getArticleDetail(item: 0)
        let arcticleDetails: ArcticleDetails = (mdlView.model?[value])!
        cell.setSelected(true, animated: true)
        XCTAssertEqual(cell.mdlView.model?.assetID, arcticleDetails.assetID)
    }
    
    func testDidSelectRowAtIndex() {
        
        homeViewCntr.ib_tblView.delegate?.tableView?(homeViewCntr.ib_tblView, didSelectRowAt: IndexPath(row: 0, section: 0))
    }
}
