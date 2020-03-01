//
//  NetworkManagerTest.swift
//  NewsAppTests
//
//  Created by Toyaj Nigam on 01/03/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import XCTest
@testable import NewsApp

class NetworkManagerTest: XCTestCase {

    let networkManager: NetworkManager = NetworkManager()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testgetNYArticles() {
        networkManager.getNYArticles(onSuccess: { (response) in
            XCTAssertNotNil(response)
        }) {
            
        }
    }
}
