//
//  ViewController.swift
//  Twittermenti
//
//  Created by Petar Iliev on 11/21/2022.
//  Copyright © 2022 Petar Iliev. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {
    
    // setup
    let swifter = Swifter(consumerKey: K.consumerKey, consumerSecret: K.secretKey)
    let classifier = TwitterAnalyzer()

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // testing API
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended) { results, metadata in
            let decoder = JSONDecoder()
            do {
                // get tweets
                var tweets: [String] = []
                for i in 0..<100 {
                    if let tweet = results[i]["full_text"].string {
                        tweets.append(tweet)
                    }
                }
            } catch {
                print("Error while decoding data: \(error.localizedDescription)")
            }
        } failure: { error in
            print("Error in Twitter API request: \(error.localizedDescription)")
        }
        
    }

    @IBAction func predictPressed(_ sender: Any) {
        
    }
    
}

