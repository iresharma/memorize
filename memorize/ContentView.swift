//
//  ContentView.swift
//  memorize
//
//  Created by iresh sharma on 22/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: nil) {
            ForEach(0..<3) { index in
                CardRow()
            }
        }
    }
}

struct CardRow: View {
    var body: some View {
        HStack(alignment: .center) {
            ForEach(0..<3){ index in
                if index%2 == 0 {
                    CardView(isFaceUp: true)
                } else {
                    CardView()
                }
            }
        }.foregroundColor(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 25.0).fill(Color.white)
                Text("🚀").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 25.0).fill()
            }
//                  The code underneath will create the desired look in light mode but F up in dark mode that's why we add the line above to fix it
            RoundedRectangle(cornerRadius: 25.0).stroke(lineWidth: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
