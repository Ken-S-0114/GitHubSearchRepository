//
//  main.swift
//  GitHubSearchRepository
//
//  Created by 佐藤賢 on 2018/03/10.
//  Copyright © 2018年 佐藤賢. All rights reserved.
//

import Foundation

print("Enter your query here> ", terminator: "")

// 入力された検索クエリの取得
guard let keyword = readLine(strippingNewline: true) else {
  exit(1)
}

// APIクライアントの生成
let client = GitHubClient()
// リクエストの発行
let request = GitHubAPI.SearchRepositories(keyword: keyword)

// リクエストの送信
client.send(request: request) { result in
  switch result {
  case let .success(response):
    for item in response.items {
      // リポジトリの所有者と名前を表示
      print(item.owner.login + "/" + item.name)
    }
    exit(0)
  case let .failure(error):
    // エラー詳細を出力
    print("Error: \(error)")
    exit(1)
  }
}

// タイムアウト時間
let timeoutInterval: TimeInterval = 60

// タイムアウトまでメインスレッドを停止
Thread.sleep(forTimeInterval: timeoutInterval)

// タイムアウト後の処理
print("Connection timeout")
exit(1)
