//
//  Result.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

enum Result<T, Error: Swift.Error> {
  case success(T)
  case failure(Error)
  
  init(value: T) {
    self = .success(value)
  }
  
  init(error: Error) {
    self = .failure(error)
  }
}
