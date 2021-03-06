//
//  GitHubAPI.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

import Foundation

final class GitHubAPI {
  // リポジトリ検索APIの実装
  struct SearchRepositories: GitHubRequest {
    let keyword: String
    
    // GitHubRequestが要求する連想型
    typealias Response = SearchResponse<Repository>
    
    var method: HTTPMethod {
      return .get
    }
    
    var path: String {
      return "/search/repositories"
    }
    
    var queryItems: [URLQueryItem] {
      return [URLQueryItem(name: "q", value: keyword)]
    }
  }
  
  // ユーザー検索APIの実装:（今回は非実装）
  struct SearchUsers: GitHubRequest {
    let keyword: String
    
    typealias Response = SearchResponse<User>
    
    var method: HTTPMethod {
      return .get
    }
    
    var path: String {
      return "/search/users"
    }
    
    var queryItems: [URLQueryItem] {
      return [URLQueryItem(name: "q", value: keyword)]
    }
  }
}
