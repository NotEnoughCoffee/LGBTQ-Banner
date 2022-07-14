//
//  ImageHandling.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/13/22.
//

import SwiftUI

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self.edgesIgnoringSafeArea(.all))
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
    func asImage() -> UIImage {
            let controller = UIHostingController(rootView: self)

            // locate far out of screen
            controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)

            let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
            controller.view.bounds = CGRect(origin: .zero, size: size)
            controller.view.sizeToFit()
            UIApplication.shared.windows.first?.rootViewController?.view.addSubview(controller.view)

            let image = controller.view.asImage()
            controller.view.removeFromSuperview()
            return image
        }
}
extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
// [!!] Uncomment to clip resulting image
            rendererContext.cgContext.addPath(
                UIBezierPath(arcCenter: CGPoint(x: 50.0, y: 50.0), radius: 200, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true).cgPath)
//             rendererContext.cgContext.addPath(
//                UIBezierPath(roundedRect: bounds, cornerRadius: 2).cgPath)
            rendererContext.cgContext.clip()

// As commented by @MaxIsom below in some cases might be needed
// to make this asynchronously, so uncomment below DispatchQueue
// if you'd same met crash
//            DispatchQueue.main.async {
                 layer.render(in: rendererContext.cgContext)
//            }
        }
    }
}
