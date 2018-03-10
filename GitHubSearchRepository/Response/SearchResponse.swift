//
//  SearchResponse.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

struct SearchResponse<Item: Decodable> : Decodable {
  let totalCount: Int
  let items: [Item]
  
  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case items
  }
}
