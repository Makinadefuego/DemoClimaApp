//
//  LoadingView.swift
//  DemoClima
//
//  Created by Fernando Daniel Portilla Posadas on 11/04/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
