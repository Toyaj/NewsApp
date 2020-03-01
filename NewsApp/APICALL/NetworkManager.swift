//
//  Service.swift
//  NewsApp
//
//  Created by Toyaj Nigam on 29/02/20.
//  Copyright © 2020 Toyaj Nigam. All rights reserved.
//

import Foundation

class NetworkManager {
    // MARK: - API Call 
    func getNYArticles(onSuccess: @escaping ([ArcticleDetails]) -> (), onFailure: @escaping () -> ()) {
        
        let articleUrl = "\(ServiceApi.url)\(Bundle.main.object(forInfoDictionaryKey: "NYTimesAppKey") ?? "")"
        guard let url = URL(string: articleUrl)  else {return}
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            guard let data = data else{
                return
            }
            do {
                let articleDetails = try JSONDecoder().decode(NYArticleModel.self, from: data)
                onSuccess(articleDetails.results)
            }catch let jsonerr {
                print("JSON error",jsonerr)
            }
        }.resume()
    }
}
