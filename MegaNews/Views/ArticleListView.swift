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
        NavigationStack {
            //            List(Article.previewData) {
            List(articleVM.articles) {
                article in
                ArticleRowView(article: article)
            }
            .navigationTitle("News")
            .onAppear { articleVM.loadArticles(query: "") }
            .refreshable {
                articleVM.loadArticles(query: "")
            }

        }

    }
}

#Preview {
    ArticleListView()
}
