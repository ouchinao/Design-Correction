//
//  Help.swift
//  Design correction
//
//  Created by 大内直 on 2024/03/09.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        // ヘルプ画面のコンテンツ
        Text("")
            .toolbar {
                // 中央に大きなタイトルを表示
                ToolbarItem(placement: .principal) {
                    Text("ヘルプ画面")
                        .font(.largeTitle) // 大きなフォントに設定
                }
            }
    }
}
