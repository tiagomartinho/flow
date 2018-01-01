import Cocoa
import NotificationCenter
import Core

class TodayViewController: NSViewController, NCWidgetProviding {

    @IBOutlet weak var valueTextField: NSTextFieldCell!

    let repository = ValueRepository()

    override var nibName: NSNib.Name? {
        return NSNib.Name("TodayViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        repository.load { value in
            DispatchQueue.main.async {
                self.valueTextField.stringValue = "\(value)"
            }
        }
    }

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        completionHandler(.newData)
    }

}
