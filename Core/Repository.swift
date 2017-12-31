public protocol Repository {
    associatedtype T
    func load() -> T
    func write(_ value: T)
}
