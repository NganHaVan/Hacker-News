//
//  DetailView.swift
//  Hacker News
//
//  Created by Janet Van on 23.12.2019.
//  Copyright © 2019 Janet Van. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
