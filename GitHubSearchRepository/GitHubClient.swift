//
//  GitHubClient.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

import Foundation

// HTTPクライアントの実装
class GitHubClient {
  private let session: URLSession = {
    let configuration = URLSessionConfiguration.default
    let session = URLSession(configuration: configuration)
    return session
  }()
  
  // APIクライアントのインターフェース定義
  func send<Request: GitHubRequest>(
    request: Request,
    completion: @escaping (Result<Request.Response, GitHubClientError>) -> Void) {
    // HTTPリクエストの送信
    let urlRequest = request.buildURLRequest()
    let task = session.dataTask(with: urlRequest) {
      data, response, error in
      
      // HTTPレスポンスの処理
      switch (data, response, error) {
      case (_, _, let error?):
        completion(Result(error: .connectionError(error)))
      case (let data?, let response?, _):
        do {
          let response = try request.response(
            from: data, urlResponse: response)
          completion(Result(value: response))
        } catch let error as GitHubAPIError {
          completion(Result(error: .apiError(error)))
        } catch {
          completion(Result(error: .responseParseError(error)))
        }
        
      default:
        fatalError("invalid response combination \(String(describing: data)), \(String(describing: response)), \(String(describing: error)).")
      }
    }
    task.resume()
  }
}
