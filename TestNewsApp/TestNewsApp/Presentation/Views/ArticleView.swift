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
                if #available(iOS 15.0, *) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)

                    } placeholder: {
                        PlaceholderImageView()
                    }
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                }
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
