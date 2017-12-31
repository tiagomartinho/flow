public protocol Repository {
    associatedtype T
    func load(handler: @escaping (T)->Void)
    func write(_ value: T)
}
