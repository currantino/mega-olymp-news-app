//
//  FullArticleView.swift
//  MegaNews
//
//  Created by Матвей Смородин on 21.03.2025.
//

import SwiftUI

struct FullArticleView: View {

    @State var article: Article

    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                AsyncImage(url: URL(string: article.urlToImage)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(minWidth: 100, minHeight: 100)
                .aspectRatio(contentMode: .fit)
                .clipped()
                VStack(spacing: 8) {
                    Text(article.title)
                        .font(.headline)
                        .bold()
                    Text(article.content)
                        .font(.caption)
                }
            }
            .padding()
            .navigationTitle("Selected article")
        }
    }
}

#Preview {
    FullArticleView(article: Article.previewData[2])
}
