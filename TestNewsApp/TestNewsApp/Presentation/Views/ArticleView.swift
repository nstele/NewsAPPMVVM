//
//  ArticleView.swift
//  TestNewsApp
//
//  Created by Natalia  Stele on 01/06/2021.
//

import SwiftUI
import URLImage

struct ArticleView: View {

    let article: Article

    var body: some View {
        HStack {
            if let imageURL = article.image, let url = URL(string: imageURL) {
                URLImage(url) { _ in
                    // This view is displayed before download starts
                    EmptyView()
                } failure: { error, retry in
                    // Display error and retry button
                    PlaceholderImageView()
                } content: { image in
                    // Downloaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                PlaceholderImageView()
            }
            VStack(alignment: .leading, spacing: 4)   {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                Text(article.source ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100,height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.testArticle)
            .previewLayout(.sizeThatFits)
    }
}
