import Core
import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var valueText: NSTextField!

    let repository = ValueRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        repository.load { value in
            DispatchQueue.main.async {
                self.valueText.stringValue = "\(value)"
            }
        }
    }
}