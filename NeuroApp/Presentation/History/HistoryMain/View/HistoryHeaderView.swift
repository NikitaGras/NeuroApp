//
//  HistoryHeaderView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 09.12.2021.
//

import Charts

class HistoryHeaderView: UITableViewHeaderFooterView {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = String.Score.yourRecentScore
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.frame.size.height = Appearance.labelHeight
        return label
    }()
    var chartView: LineChartView = {
        let chartView = LineChartView()
        chartView.rightAxis.enabled = false
        chartView.leftAxis.labelFont = UIFont.systemFont(ofSize: 18)
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = UIFont.systemFont(ofSize: 18)
        
        chartView.drawGridBackgroundEnabled = false
        
        return chartView
    }()
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
    
    func setupChartView(with history: [Result]) {
        chartView.xAxis.labelCount = history.count
        
        var chartDataEntry: [ChartDataEntry] = []
        for result in history {
            let dataEntryX = Double(result.finishTime.timeIntervalSince1970)
            let dataEntryY = Double(result.avarageScore)
            let dataEntry = ChartDataEntry(x: dataEntryX, y: dataEntryY)
            chartDataEntry.append(dataEntry)
        }
        
        let dataSet = LineChartDataSet(chartDataEntry)
        dataSet.label = ""
        dataSet.form = .none
        dataSet.setCircleColor(UIColor.NABlue)
        dataSet.drawVerticalHighlightIndicatorEnabled = false
        dataSet.lineWidth = 4
        
        let data = LineChartData(dataSet: dataSet)
        data.setDrawValues(false)
    
        chartView.data = data
    }
    
    private func setupInitialState() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(chartView)
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
}
