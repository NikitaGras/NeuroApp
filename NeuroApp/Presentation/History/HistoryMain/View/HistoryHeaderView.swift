//
//  HistoryHeaderView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 09.12.2021.
//

import Charts

class HistoryHeaderView: UITableViewHeaderFooterView {
    var titleLabel = UILabel()
    var chartView = LineChartView()
    
    var axisFormatterDelegate: IAxisValueFormatter?
    
    private var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        df.setLocalizedDateFormatFromTemplate("MMM d")
        return df
    }()
    
    struct Appearance {
        static let labelHeight: CGFloat = 20
        static let margin: CGFloat = 20
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupInitialState()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitialState()
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        layout()
    }

    func updateChartView(with history: [Result]) {
        chartView.xAxis.setLabelCount(history.count, force: false)
        var chartDataEntry: [ChartDataEntry] = []
        for index in 0..<history.count {
            let xAxisValue = Double(history[index].finishTime.timeIntervalSince1970)
            let dataEntryX = xAxisValue
            let dataEntryY = Double(history[index].avarageScore)
            let dataEntry = ChartDataEntry(x: dataEntryX, y: dataEntryY)
            chartDataEntry.append(dataEntry)
        }
        let dataSet = LineChartDataSet(chartDataEntry)
        setup(dataSet: dataSet)
        let data = LineChartData(dataSet: dataSet)
        data.setDrawValues(false)
        chartView.data = data
    }
    
    private func setupInitialState() {
        axisFormatterDelegate = self
        contentView.addSubview(titleLabel)
        contentView.addSubview(chartView)
        setup(chartView: chartView)
        setup(label: titleLabel)
    }
    
    private func layout() {
        titleLabel.frame = CGRect(x: Appearance.margin,
                                  y: 0,
                                  width: contentView.bounds.width - 2 * Appearance.margin,
                                  height: Appearance.labelHeight)
        chartView.frame = CGRect(x: Appearance.margin,
                                 y: Appearance.margin + titleLabel.frame.height,
                                 width: contentView.bounds.width - 2 * Appearance.margin,
                                 height: contentView.bounds.height - 2 * Appearance.margin - titleLabel.frame.height)
    }
    
    private func setup(chartView: LineChartView) {
        chartView.pinchZoomEnabled = false
        chartView.doubleTapToZoomEnabled = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.labelFont = UIFont.systemFont(ofSize: 18)
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = UIFont.systemFont(ofSize: 18)
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.xAxis.valueFormatter = axisFormatterDelegate
    }
    
    private func setup(label: UILabel) {
        label.text = String.Score.yourRecentScore
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.frame.size.height = Appearance.labelHeight
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
