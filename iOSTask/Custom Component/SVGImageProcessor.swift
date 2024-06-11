//
//  SVGImageProcessor.swift
//  iOSTask
//
//  Created by sherif on 10/06/2024.
//

import UIKit
import Kingfisher
import SVGKit

public struct SVGImgProcessor: ImageProcessor {
    
    public var identifier: String = "com.appidentifier.webpprocessor"
    
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            if let imsvg = SVGKImage(data: data) {
                return imsvg.uiImage
            }
           
            return KFCrossPlatformImage(data: data)
        }
    }
}
