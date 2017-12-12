//
//  Util.swift
//  FlickFinder
//
//  Created by User on 12/10/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

typealias FKDictionary = [String: AnyObject]
typealias FKArray = [FKDictionary]

class Util {
    class func showAlert(for message: String, in viewController: UIViewController) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    class func createURL(with parameters: FKDictionary) -> URL{
        var components = URLComponents()
        components.scheme = Constants.Flickr.APIScheme
        components.host = Constants.Flickr.APIHost
        components.path = Constants.Flickr.APIPath
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
}
