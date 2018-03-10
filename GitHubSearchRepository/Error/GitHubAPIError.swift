//
//  GitHubAPIError.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

struct GitHubAPIError: Decodable, Error {
  struct FieldError: Decodable {
    let resource: String
    let field: String
    let code: String
  }
  
  let message: String
  let fieldError: [FieldError]
}
