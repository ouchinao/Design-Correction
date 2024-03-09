//
//  History.swift
//  Design correction
//
//  Created by 大内直 on 2024/03/09.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        // 履歴画面のコンテンツ
        Text("")
            .toolbar {
                // 中央に大きなタイトルを表示
                ToolbarItem(placement: .principal) {
                    Text("履歴")
                        .font(.largeTitle) // 大きなフォントに設定
                }
            }
    }
}
