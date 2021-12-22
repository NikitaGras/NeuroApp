//
//  HistoryHeaderView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 09.12.2021.
//

import Charts
import UIKit

class HistoryHeaderView: UIView {
    struct Appearance {
        static let spasing: CGFloat = 20
    }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = String.Score.yourRecentScore
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        return label
    }()
    var chartView: LineChartView = {
        let chartView = LineChartView()
        chartView.pinchZoomEnabled = false
        chartView.doubleTapToZoomEnabled = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.labelFont = UIFont.systemFont(ofSize: 16)
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = UIFont.systemFont(ofSize: 16)
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.centerAxisLabelsEnabled = true
        chartView.leftAxis.drawGridLinesEnabled = false
        return chartView
    }()
    
    var axisFormatterDelegate: IAxisValueFormatter?
    private var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        df.setLocalizedDateFormatFromTemplate("MMM d")
        return df
    }()
    
    var history: [Result] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func setupInitialState() {
        axisFormatterDelegate = self
        chartView.xAxis.valueFormatter = axisFormatterDelegate
        layout()
    }
    
    private func layout() {
        self.addSubview(titleLabel)
        self.addSubview(chartView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Appearance.spasing),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Appearance.spasing),
            titleLabel.bottomAnchor.constraint(equalTo: chartView.topAnchor, constant: -Appearance.spasing)
        ])
        chartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //TODO: Необходимо придумать как расставить констрейнты
            chartView.widthAnchor.constraint(equalToConstant: 370),
            
            chartView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            chartView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Appearance.spasing),
            NSLayoutConstraint(item: chartView, attribute: .height, relatedBy: .equal, toItem: chartView, attribute: .width, multiplier: 0.5, constant: 0),
        ])
    }
    
    func updateChartView(with history: [Result]) {
        chartView.xAxis.axisMinLabels = 1
        chartView.xAxis.granularityEnabled = true
        chartView.xAxis.setLabelCount(history.count, force: false)
        
        let chartDataEntry: [ChartDataEntry] = history.map { result in
            let xAxisValue = Double(result.finishTime.timeIntervalSince1970)
            let dataEntryX = xAxisValue
            let dataEntryY = Double(result.avarageScore)
            return ChartDataEntry(x: dataEntryX, y: dataEntryY)
        }
        
        let dataSet = LineChartDataSet(chartDataEntry)
        setup(dataSet: dataSet)
        
        let data = LineChartData(dataSet: dataSet)
        data.setDrawValues(false)
        chartView.data = data
    }
    
    private func setup(dataSet: LineChartDataSet) {
        dataSet.label = ""
        dataSet.form = .none
        dataSet.setColor(UIColor.NABlue)
        dataSet.setCircleColor(UIColor.NABlue)
        dataSet.drawVerticalHighlightIndicatorEnabled = true
        dataSet.drawHorizontalHighlightIndicatorEnabled = true
        dataSet.lineWidth = 4
    }
}


extension HistoryHeaderView: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let date = Date(timeIntervalSince1970: value)
        return dateFormatter.string(from: date)
    }
}
