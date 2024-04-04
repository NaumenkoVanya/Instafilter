//
//  ShareLinkCV.swift
//  Instafilter
//
//  Created by Ваня Науменко on 4.04.24.
//

import SwiftUI

struct ShareLinkCV: View {
    var body: some View {
        let example = Image(.chopper)
        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ShareLinkCV()
}
