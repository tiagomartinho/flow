import UIKit
import Core

class ViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    let repository = ValueRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository.load { value in
            DispatchQueue.main.async {
                self.valueLabel.text = "\(value)"
            }
        }
    }
}
