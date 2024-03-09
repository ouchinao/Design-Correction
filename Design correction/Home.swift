//
//  Home.swift
//  Design correction
//
//  Created by 大内直 on 2024/03/09.
//

import SwiftUI

struct HomeView: View {
    @State private var isSheetPresented = false
    @State private var selectedPDFURL: URL?
    
    var body: some View {
        VStack {
            Button("Drop PDF") {
                isSheetPresented.toggle()
            }
            .font(Font.system(size: 30))
            .fileImporter(
                isPresented: $isSheetPresented,
                allowedContentTypes: [.pdf],
                allowsMultipleSelection: false
            ){ result in
                do {
                    let fileURL = try result.get().first!
                    // 選択されたpdfの処理を行う
                    handleSelectedPDF(fileURL: fileURL)
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        .navigationBarTitle("") // タイトルを非表示にする
        .toolbar {
            // 中央に大きなタイトルを表示
            ToolbarItem(placement: .principal) {
                Text("DesignCorrection")
                    .font(.largeTitle) // 大きなフォントに設定
            }
        }
    }

    // handleSelectedPDFメソッドの実装も必要です
    func handleSelectedPDF(fileURL: URL) {
        print("Selected PDF: \(fileURL.lastPathComponent)")
        selectedPDFURL = fileURL
    }
}
