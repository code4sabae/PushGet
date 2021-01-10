//
//  ContentView.swift
//  PushGet
//
//  Created by Taisuke Fukuno on 2021/01/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userdata = UserData.shared
    var body: some View {
        VStack {
            Spacer()
            QRCodeView(url: "https://app.sabae.cc/apnpush/#" + userdata.token)
            Text("↑ぷっしゅを受け取るアプリへ")
            Spacer()
            Button(action: {
                UIApplication.shared.open(URL(string: "https://fukuno.jig.jp/3091")!)
            }){ Text("App by @taisukef / 福野泰介の一日一創") }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 // https://chart.apis.google.com/chart?chs=300x300&cht=qr&chl=" + token
// URLImageView(viewModel: .init(url: "https://chart.apis.google.com/chart?chs=450x450&cht=qr&chl=" + make(token: userdata.token)))
     .frame(width: 450, height: 450)
// WebView(url: "https://fukuno.jig.jp/2012/qrmaker#" + userdata.token) // ng

extension String {
    var urlEncoded: String {
        // 半角英数字 + "/?-._~" のキャラクタセットを定義
        let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
        // 一度すべてのパーセントエンコードを除去(URLデコード)
        let removed = removingPercentEncoding ?? self
        // あらためてパーセントエンコードして返す
        return removed.addingPercentEncoding(withAllowedCharacters: charset) ?? removed
    }
}
 */
