//
//  ContextDataView.swift
//  PulseInsightDemoApp
//
//  Created by shenlongshenlongshenlong on 2025/2/24.
//

import UIKit
import PulseInsights

class ContextDataView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var keyValueContainer: UIStackView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        loadViewFromNib()
        styleButtons()
    }
    
    private func styleButtons() {
        contentView.subviews.forEach { view in
            if let button = view as? UIButton {
                button.backgroundColor = UIColor(red: 0.647, green: 0.318, blue: 0.549, alpha: 1.0)
                button.setTitleColor(.white, for: .normal)
                button.layer.cornerRadius = 8
                button.layer.masksToBounds = true
            }
        }
    }
    
    @IBAction func handleAddKeyValuePair(_ sender: Any) {
        if let keyValueView = Bundle.main.loadNibNamed("KeyValuePair", owner: nil)?.first as? UIView {
            keyValueContainer.addArrangedSubview(keyValueView)
        }
    }
    
    @IBAction func handleClearKeyValuePairs(_ sender: Any) {
        keyValueContainer.arrangedSubviews.forEach { $0.removeFromSuperview() }
        PulseInsights.getInstance.clearContextData()
    }
    
    @IBAction func handleSaveContextData(_ sender: Any) {
        var data: [String: String] = [:]
        
        keyValueContainer.arrangedSubviews.forEach { view in
            if let keyField = view.viewWithTag(1) as? UITextField,
               let valueField = view.viewWithTag(2) as? UITextField,
               let key = keyField.text, !key.isEmpty,
               let value = valueField.text, !value.isEmpty {
                data[key] = value
            }
        }
        
        PulseInsights.getInstance.setContextData(data)
        resultLabel.isHidden = false
    }
}
