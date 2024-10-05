//
//  VPScrollableImageView.swift
//  VPScrollableImageView
//
//  Created by Hiten on 2024/10/05.
//  Copyright (c) 2024 Hiten All rights reserved.

import SwiftUI
import SDWebImageSwiftUI

@available(iOS 14.0, *)
public struct VPScrollableImageView<Content>: View where Content: View {

    private var url: URL
    private var min: CGFloat = 1.0
    private var max: CGFloat = 3.0
    private var showsIndicators: Bool = false
    @ViewBuilder private var overlay: () -> Content

    @State private var imageSize: CGSize = .zero

    /**
     Initializes an `VPScrollableImageView`
     */
    public init(url: URL,
                min: CGFloat = 1.0,
                max: CGFloat = 3.0,
                showsIndicators: Bool = false,
                @ViewBuilder overlay: @escaping () -> Content) {
        self.url = url
        self.min = min
        self.max = max
        self.showsIndicators = showsIndicators
        self.overlay = overlay
    }

    public var body: some View {
        GeometryReader { proxy in
            VPScrollableView(size: imageSize, min: self.min, max: self.max, showsIndicators: self.showsIndicators) {
                WebImage(url: url)
                    .resizable()
                    .onSuccess(perform: { image, _, _ in
                        DispatchQueue.main.async {
                            self.imageSize = CGSize(width: proxy.size.width, height: proxy.size.width * (image.size.height / image.size.width))
                        }
                    })
                    .indicator(.activity)
                    .scaledToFit()
                    .clipShape(Rectangle())
                    .overlay(self.overlay())
            }
        }
    }
}
