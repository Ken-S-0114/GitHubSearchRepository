//
//  GitHubClientError.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

enum GitHubClientError: Error {
  // 通信に失敗
  case connectionError(Error)
  // レスポンスの解釈に失敗
  case responseParseError(Error)
  // APIからエラーレスポンスを受け取った
  case apiError(GitHubAPIError)
}
