//
//  ChartCell.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//

import UIKit
import Charts
class ChartCell: UITableViewCell {

    static let NAME = "ChartCell"
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var pieChart: PieChartView!
    
    var data: QuestionForCell? {
        didSet {
            guard let data = data else {
                return
            }
            setData(data: data)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(data: QuestionForCell) {
        lblTitle.text = data.question
        var entries = [PieChartDataEntry]()
        var colors = [UIColor]()
        for i in 0..<data.responses.count {
            let entry = PieChartDataEntry(
                value: data.responses[i].value,
                label: "\(data.responses[i].data) \(data.responses[i].value)%" ,
                data: data.responses[i].value)
            entries.append(entry)
            
            colors.append(data.responses[i].color)
            
        }
        let pieDataSet = PieChartDataSet(entries: entries, label: "")
        pieDataSet.colors = colors
        pieChart.drawEntryLabelsEnabled = false
        let pieData = PieChartData(dataSet: pieDataSet)
        pieChart.data = pieData
    }
    
}
