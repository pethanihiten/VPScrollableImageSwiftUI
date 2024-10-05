# VPScrollableImage


To implement zoom, scroll, pinch, and double-tap-to-center capabilities for an image in SwiftUI

## Usage 

Add the package to Xcode `https://github.com/pethanihiten/VPScrollableImageSwiftUI.git` and target the `main` branch, no officail release yet.


```swift
import VPScrollableImage

var body: some View {
    GeometryReader { proxy in
        let image = UIImage(named: "3")
        let imageSize = image?.size ?? CGSize(width: 1, height: 1)
        let aspectRatio = imageSize.width / imageSize.height
        let frameHeight = proxy.size.width / aspectRatio
        VPScrollableView(size: CGSize(width: proxy.size.width, height: frameHeight), min: 1.0, max: 6.0, showsIndicators: true) {
            Image("3")
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width, height: frameHeight)
                .background(Color.black)
                .clipped()
        }
        .frame(width: proxy.size.width, height: frameHeight)
        .overlay(
            Rectangle()
                .fill(Color.clear)
                .border(Color.black, width: 1)
            )
        }      
}
```

## Contribute 

Contributions are warmly welcomed! Feel free to reference the todos above or file an issue.


## Contact

[Skype](pethanihiten_1)

## Liscense

MIT
