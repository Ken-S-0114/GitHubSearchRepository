//
//  GitHubRequest.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

import Foundation

protocol GitHubRequest {
  associatedtype Response: Decodable
  
  var baseURL: URL { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var queryItems: [URLQueryItem] { get }
}

extension GitHubRequest {
  var baseURL: URL {
    return URL(string: "https://api.github.com")!
  }
}
