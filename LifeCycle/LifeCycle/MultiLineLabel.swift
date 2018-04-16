import UIKit

class MultiLineLabel: UILabel {
    
    init() {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        text = "Hello"
        textColor = UIColor.black.withAlphaComponent(0.5)
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        print("Layout subviews")
        super.layoutSubviews()
    }
}
