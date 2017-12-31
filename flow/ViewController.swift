import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!

    let repository = ValueRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func write(_ sender: UIButton) {
        repository.write(Int(valueTextField.text!)!)
        updateUI()
    }

    func updateUI() {
        valueLabel.text = "\(repository.load())"
    }
}

protocol Repository {
    associatedtype T
    func load() -> T
    func write(_ value: T)
}

class ValueRepository: Repository {

    var value = 42

    func write(_ value: Int) {
        self.value = value
    }

    func load() -> Int {
        return value
    }
}
