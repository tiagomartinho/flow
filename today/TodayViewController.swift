import UIKit
import NotificationCenter
import Core

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var valueLabel: UILabel!

    let repository = ValueRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        valueLabel.text = "\(repository.load())"
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
