//
//  GitHubClientError.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

enum GitHubClientError: Error {
  case connectionError
  case responseParseError
  case apiError(GitHubAPIError)
}
