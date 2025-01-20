//
//  WeeklyMealNutrientChartView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI
import DGCharts

// Weekly Meal Nutrient Chart View
struct WeeklyMealNutrientChartView: UIViewRepresentable {
    func makeUIView(context: Context) -> BarChartView {
        let chartView = BarChartView()
        chartView.noDataText = "No data available."
        chartView.chartDescription.enabled = false
        chartView.legend.enabled = false

        // Sample data for the chart
        let entries = [
            BarChartDataEntry(x: 1, y: 30),
            BarChartDataEntry(x: 2, y: 50),
            BarChartDataEntry(x: 3, y: 20),
            BarChartDataEntry(x: 4, y: 40),
            BarChartDataEntry(x: 5, y: 35),
            BarChartDataEntry(x: 6, y: 25),
            BarChartDataEntry(x: 7, y: 45)
        ]

        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["S", "S", "M", "T", "W", "T", "F", "S"])
        chartView.xAxis.granularity = 1
        chartView.xAxis.labelPosition = .bottom


        let dataSet = BarChartDataSet(entries: entries, label: "Weekly Nutrition")
        dataSet.colors = [NSUIColor(Color(hex: "#E29523")), NSUIColor(Color(hex: "#5CA660"))]
        let data = BarChartData(dataSet: dataSet)
        chartView.data = data

        return chartView
    }

    func updateUIView(_ uiView: BarChartView, context: Context) {}
}


struct WeeklyMealNutrientChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyMealNutrientChartView()
    }
}
