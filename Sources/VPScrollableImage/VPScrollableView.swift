//
//  VPScrollableView.swift
//  VPScrollableView
//
//  Created by Hiten on 2024/10/05.
//  Copyright (c) 2024 Hiten All rights reserved.


import SwiftUI

@available(iOS 13.0, *)
public struct VPScrollableView<Content>: View where Content: View {

    private var size: CGSize
    private var min: CGFloat = 1.0
    private var max: CGFloat = 3.0
    private var showsIndicators: Bool = false
    @ViewBuilder private var content: () -> Content

    /**
     Initializes an `VPScrollableView`
     */
    public init(size: CGSize,
                min: CGFloat = 1.0,
                max: CGFloat = 3.0,
                showsIndicators: Bool = false,
                @ViewBuilder content: @escaping () -> Content) {
        self.size = size
        self.min = min
        self.max = max
        self.showsIndicators = showsIndicators
        self.content = content
    }

    public var body: some View {
        content()
            .frame(width: size.width, height: size.height, alignment: .center)
            .contentShape(Rectangle())
            .modifier(VPScrollableImageModifier(contentSize: self.size, min: min, max: max, showsIndicators: showsIndicators))
    }
}
