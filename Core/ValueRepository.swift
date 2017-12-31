public class ValueRepository: Repository {

    var value = 42

    public init() {
    }

    public func write(_ value: Int) {
        self.value = value
    }

    public func load() -> Int {
        return value
    }
}
