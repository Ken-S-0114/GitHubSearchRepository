//
//  GitHubRequest.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

import Foundation

protocol GitHubRequest {
  // リクエストとレスポンスの紐付け
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
  // リクエストを表す型のURLRequest型へのマッピング
  func buildURLRequest() -> URLRequest {
    let url = baseURL.appendingPathComponent(path)
    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
    
    switch method {
    case .get:
      components?.queryItems = queryItems
    default:
      fatalError("Unsupported method \(method)")
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.url = components?.url
    urlRequest.httpMethod = method.rawValue
    
    return urlRequest
  }
  
  // Data型とHTTPURLResponse型のレスポンスを表す型へのマッピング
  func response(from data: Data,
                urlResponse: URLResponse) throws -> Response {
    let decoder = JSONDecoder()
    
    // HTTPURLResponseを確認することで処理を分岐させる
    if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
      // JSONからモデルをインスタンス
      return try decoder.decode(Response.self, from: data)
    } else {
      // JSONからAPIエラーをインスタンス化
      throw try decoder.decode(GitHubAPIError.self, from: data)
    }
  }
}
