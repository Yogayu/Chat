//
//  SwiftUIView.swift
//  
//
//  Created by Alex.M on 07.07.2022.
//

import SwiftUI
import MarkdownUI

struct MessageTextView: View {

    let text: String?
    let messageUseMarkdown: Bool

    var body: some View {
        if let text = text, !text.isEmpty {
            textView(text)
        }
    }

    @ViewBuilder
    private func textView(_ text: String) -> some View {

        Markdown(text)
            .markdownBlockStyle(\.blockquote) { configuration in
              configuration.label
                .padding()
                .markdownTextStyle {
                    FontSize(13)
                    FontWeight(.light)
                    BackgroundColor(nil)
                }
                .overlay(alignment: .leading) {
                  Rectangle()
                    .fill(Color.gray)
                    .frame(width: 4)
                }
                .background(Color.gray.opacity(0.2))
            }
    }
}

struct MessageTextView_Previews: PreviewProvider {
    static var previews: some View {
        MessageTextView(text: "Hello world!", messageUseMarkdown: false)
    }
}
