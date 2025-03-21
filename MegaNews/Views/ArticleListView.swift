//
//  ArticleListView.swift
//  MegaNews
//
//  Created by Матвей Смородин on 21.03.2025.
//

import SwiftUI

struct ArticleListView: View {

    @StateObject var articleVM: ArticleViewModel = ArticleViewModel.shared

    var body: some View {
        NavigationView {
            List {
                //                            ForEach(Article.previewData) { article in
                ForEach(articleVM.articles) { article in
                    ArticleRowView(article: article)

                }
            }
        }
        .onAppear { articleVM.loadArticles(query: "") }
        .refreshable {
        }
    }
}

#Preview {
    ArticleListView()
}
