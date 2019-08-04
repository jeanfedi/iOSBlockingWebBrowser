//
//  BlockerConfiguration.swift
//  BlockingWebBrowser
//
//  Created by Phoedo on 04/08/2019.
//  Copyright © 2019 Phoedo. All rights reserved.
//

import WebKit

class BlockerConfiguration {
    
    
    fileprivate let blockingRulesId = "blockingRulesId"
    
    func loadConfiguration(filename: String!, completionHandler: ((WKContentRuleList?, Error?) -> Void)!)  {
        if let path = Bundle.main.path(forResource: "blockTrackers.json", ofType: nil)
        {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let settings = String(decoding: data, as: UTF8.self)
                WKContentRuleListStore.default().compileContentRuleList(
                    forIdentifier: blockingRulesId,
                    encodedContentRuleList: settings) { (contentRuleList, error) in
                        
                        if let error = error {
                            completionHandler(nil, error)
                            return
                        }
                        completionHandler(contentRuleList, nil)
                        
                }
            } catch {
                completionHandler(nil, error)
            }
        }
        
    }
    
    
}
