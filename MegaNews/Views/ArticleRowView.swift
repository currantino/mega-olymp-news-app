//
//  ArticleRowView.swift
//  MegaNews
//
//  Created by Матвей Смородин on 21.03.2025.
//

import SwiftUI

struct ArticleRowView: View {

    @State var article: Article
    @State var showFullArticle: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: article.urlToImage)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 200)
            .aspectRatio(contentMode: .fit)
            .clipped()
            VStack(spacing: 8) {
                Text(article.title)
                    .font(.headline)
                    .bold()
                    .lineLimit(2)
                Text(article.content)
                    .font(.caption)
                    .lineLimit(2)
            }
            NavigationLink(
                destination: FullArticleView(article: article),
                isActive: self.$showFullArticle
            ) { EmptyView() }
        }
        .padding()
        .onTapGesture {
            self.showFullArticle.toggle()
        }
    }
}

#Preview {
    ArticleRowView(article: Article.previewData[1])
}
