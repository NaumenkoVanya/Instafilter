//
//  AppStoreReview.swift
//  Instafilter
//
//  Created by Ваня Науменко on 4.04.24.
//

import SwiftUI
import StoreKit

struct AppStoreReview: View {
    @Environment(\.requestReview) var requestReview
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    AppStoreReview()
}
