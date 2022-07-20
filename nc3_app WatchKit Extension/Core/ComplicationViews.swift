//
//  ComplicationViews.swift
//  nc3_app WatchKit Extension
//
//  Created by MOHAMAD IRVAN on 20/07/22.
//

import SwiftUI
import ClockKit


struct ComplicationViewCircular: View {
    let gradient2 = Gradient(colors: [.green, .yellow, .red, .purple])
    
    var body: some View {
        ZStack {
            Gauge(value: 8, in:0.0...11.0)  {
                Image(systemName: "sun.max.fill")
                    .font(.footnote)
                    .foregroundColor(Color.orange)
            } currentValueLabel: {
                Text("8")
                    .foregroundColor(Color.white)
            }
            .gaugeStyle(CircularGaugeStyle(tint: gradient2))
        }
        
    }
}

struct ComplicationViews_Previews: PreviewProvider {
    static var previews: some View {
        CLKComplicationTemplateGraphicCircularView(ComplicationViewCircular())
            .previewContext()
        
    }
}
