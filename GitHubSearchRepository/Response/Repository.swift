//
//  Repository.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

import Foundation

struct Repository: Decodable {
  let id: Int
  let name: String
  let fullName: String
  let owner: User
  
  // ローバリュー：実体の定義
  enum CordingKeys: String, CodingKey {
    case id
    case name
    case fullName = "full_name"
    case owner
  }
}
