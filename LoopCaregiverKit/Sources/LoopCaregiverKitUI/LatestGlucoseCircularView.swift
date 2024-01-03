//
//  LatestGlucoseCircularView.swift
//  LoopCaregiverWidgetExtension
//
//  Created by Bill Gestrich on 6/3/23.
//

import HealthKit
import LoopCaregiverKit
import LoopKit
import SwiftUI

public struct LatestGlucoseCircularView: View {
    
    public let viewModel: WidgetViewModel
    
    public init(viewModel: WidgetViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            Text(viewModel.currentGlucoseDateText)
                .strikethrough(viewModel.isGlucoseStale)
                .font(.footnote)
            Text(viewModel.currentGlucoseText)
                .strikethrough(viewModel.isGlucoseStale)
                .font(.headline)
                .bold()
            if let currentTrendImageName = viewModel.currentTrendImageName {
                Image(systemName: currentTrendImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 15)
                    .offset(.init(width: 0.0, height: -7.0))
            }
        }
    }
    
}

struct CurrentBGView_Previews: PreviewProvider {
    static var previews: some View {
        let latestGlucose = NewGlucoseSample(date: Date(), quantity: .init(unit: .gramsPerUnit, doubleValue: 1.0), condition: .aboveRange, trend: .down, trendRate: .none, isDisplayOnly: false, wasUserEntered: false, syncIdentifier: "12345")
        let viewModel = WidgetViewModel(timelineEntryDate: Date(), latestGlucose: latestGlucose, lastGlucoseChange: 3, isLastEntry: true, glucoseDisplayUnits: .gramsPerUnit)
        LatestGlucoseCircularView(viewModel: viewModel)
    }
}