//
//  GeoTestView.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/13/22.
//

import SwiftUI

struct PositionData: Identifiable {
    let id: Int
    let center: Anchor<CGPoint>
}

struct Positions: PreferenceKey {
    static var defaultValue: [PositionData] = []
    static func reduce(value: inout [PositionData], nextValue: () -> [PositionData]) {
        value.append(contentsOf: nextValue())
    }
}

struct PositionReader: View {
    let tag: Int
    var body: some View {
        Color.clear.anchorPreference(key: Positions.self, value: .center) { (anchor)  in
            [PositionData(id: self.tag, center: anchor)]
        }
    }
}

struct GeoTestView: View {
    @State var tag = 0
    var body: some View {
        ZStack {
            Color.green.background(PositionReader(tag: 0))
                .onTapGesture {
                    self.tag = 0
                }
            VStack {
                
                Circle()
                    .foregroundColor(Color.red)
                    .aspectRatio(1, contentMode: .fit)
                    .background(PositionReader(tag: 1))
                    .frame(width: 500, height: 600)
                    .onTapGesture {
                        self.tag = 1
                    }
            }
        }.overlayPreferenceValue(Positions.self) { preferences in
            GeometryReader { proxy in
                Circle()
                    .frame(width: 50, height: 500)
                    .position( self.getPosition(proxy: proxy, tag: self.tag, preferences: preferences))
            }
        }
    }
    func getPosition(proxy: GeometryProxy, tag: Int, preferences: [PositionData])->CGPoint {
        let p = preferences.filter({ (p) -> Bool in
            p.id == tag
        })[0]
        return proxy[p.center]
    }
}

struct CircleView: View {
    var body: some View {
        Circle()
            .padding()
        //        GeometryReader { geometry -> Text in
        //                    let frame = geometry.frame(in: CoordinateSpace.local)
        //                    return Text("\(frame.origin.x), \(frame.origin.y), \(frame.size.width), \(frame.size.height)")
        //                }
    }
}

extension View {
    func print(_ value: Any) -> Self {
        Swift.print(value)
        return self
    }
}

struct GeoTestView_Previews: PreviewProvider {
    static var previews: some View {
        GeoTestView()
    }
}
