import UIKit
import Core

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
    }
    
    func updateUI() {
        repository.load { value in
            DispatchQueue.main.async {
                self.valueLabel.text = "\(value)"
            }
        }
    }
}
