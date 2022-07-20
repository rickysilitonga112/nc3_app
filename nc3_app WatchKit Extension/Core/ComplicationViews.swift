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
    @StateObject var vm = BaseViewModel.shared
    var uvi: Double {
        return vm.currentCondition.uvi.rounded(.up)
    }
    
    var body: some View {
        ZStack {
            Gauge(value: uvi, in:0.0...11.0)  {
                Image(systemName: "sun.max.fill")
                    .font(.footnote)
                    .foregroundColor(Color.orange)
            } currentValueLabel: {
                Text("\(Int(uvi))")
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
