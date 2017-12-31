import CloudKit

public class ValueRepository: Repository {

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
        database.fetch(withRecordID: recordID) { (existingRecord, error) in
            let record: CKRecord
            if let _ = existingRecord?["value"] as? Int {
                record = existingRecord!
            } else {
                record = CKRecord(recordType: "Value", recordID: self.recordID)
            }

            record["value"] = value as NSNumber

            self.database.save(record) {
                (record, error) in
                if let error = error {
                    // Insert error handling
                    return
                }
                // Insert successfully saved record code
            }
        }
    }

    public func load(handler: @escaping (Int)->Void) {
        database.fetch(withRecordID: recordID) { (record, error) in
            if let error = error {
                // Error handling for failed fetch from public database
                return
            }
            // Display the fetched record
            if let value = record?["value"] as? Int {
                handler(value)
            }
        }
    }
}
