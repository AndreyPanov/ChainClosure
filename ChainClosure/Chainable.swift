protocol Chainable: class {
  
  var before: (()->())? { get set }
  
  func before(_ callback: @escaping ()->()) -> Self
  func invoke()
}

extension Chainable {
  
  @discardableResult
  func before(_ callback: @escaping ()->()) -> Self {
    before = callback
    return self
  }
  
  func invoke() {
    before?()
    before = nil
  }
}
