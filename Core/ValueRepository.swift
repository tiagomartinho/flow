import CloudKit

public class ValueRepository: Repository {

    let defaults = UserDefaults.standard

    var value: Int {
        get {
            return defaults.integer(forKey: "Value")
        }
        set {
            defaults.set(newValue, forKey: "Value")
        }
    }

    var container: CKContainer {
        return CKContainer(identifier: "iCloud.com.elit.flow")
    }

    var database: CKDatabase {
        return container.privateCloudDatabase
    }

    var recordID: CKRecordID {
        return CKRecordID(recordName: "Value")
    }

    public init() {
    }

    public func write(_ value: Int) {
        let record = CKRecord(recordType: "Value", recordID: recordID)
        record["value"] = value as NSNumber
        database.save(record) {
            (record, error) in
            if let error = error {
                // Insert error handling
                return
            }
            // Insert successfully saved record code
        }
        self.value = value
    }

    public func load() -> Int {
        database.fetch(withRecordID: recordID) { (record, error) in
            if let error = error {
                // Error handling for failed fetch from public database
                return
            }
            // Display the fetched record
            if let value = record?["value"] as? Int {
                self.value = value
            }
        }
        return value
    }
}
