// https://www.facebook.com/106426911076392/posts/xcode-11-swift-5-generating-qr-code-with-swiftui-hi-guys-welcome-to-this-article/132084328510650/

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView : View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url : String
    var width = 300
    var height = 300
    var body: some View {
        Image(uiImage: genrateQRImage(_url: url))
            .interpolation(.none)
            .resizable()
            .frame(width: CGFloat(self.width), height: CGFloat(self.height), alignment: .center)
    }
    func genrateQRImage(_url: String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
           }
        }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}
