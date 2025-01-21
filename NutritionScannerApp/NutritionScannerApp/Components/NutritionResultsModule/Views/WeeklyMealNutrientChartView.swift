//
//  WeeklyMealNutrientChartView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI
import DGCharts

struct WeeklyMealNutrientChartView: UIViewRepresentable {
    let data: [WeeklyMealData]

    func makeUIView(context: Context) -> BarChartView {
        let chartView = BarChartView()
        chartView.noDataText = "No data available."
        chartView.chartDescription.enabled = false
        chartView.legend.enabled = false

        let entries = data.map { BarChartDataEntry(x: $0.day, y: $0.value) }
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["S", "S", "M", "T", "W", "T", "F", "S"])
        chartView.xAxis.granularity = 1
        chartView.xAxis.labelPosition = .bottom

        let dataSet = BarChartDataSet(entries: entries, label: "Weekly Nutrition")
        dataSet.colors = [NSUIColor(Color(hex: "#E29523")), NSUIColor(Color(hex: "#5CA660"))]
        chartView.data = BarChartData(dataSet: dataSet)

        return chartView
    }

    func updateUIView(_ uiView: BarChartView, context: Context) {}
}
