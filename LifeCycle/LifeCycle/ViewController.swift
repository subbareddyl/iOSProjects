import UIKit

class ViewController: UIViewController {

    private let label = MultiLineLabel()
    private let toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.addTarget(self,
                         action: #selector(onToggleSwitchChanged),
                         for: .valueChanged)
        return toggle
    }()

    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupViews() {
        view.addSubview(label)
        view.addSubview(toggle)
    }

    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(view.centerXAnchor.constraint(equalTo: label.centerXAnchor))
        constraints.append(view.centerYAnchor.constraint(equalTo: label.centerYAnchor))
        constraints.append(view.centerXAnchor.constraint(equalTo: toggle.centerXAnchor))
        constraints.append(label.topAnchor.constraint(equalTo: toggle.bottomAnchor))
        constraints.append(label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20))
        constraints.append(label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20))
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewWillLayoutSubviews() {
        print("Will layout subviews")
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        print("Did layout subviews")
        super.viewDidLayoutSubviews()
    }
    
    @objc func onToggleSwitchChanged() {
        label.text = toggle.isOn ? "Hola" : "Hello, This is a long text. Lets see if it fits in the label"
    }
}
