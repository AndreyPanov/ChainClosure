protocol Chainable: class {
  
  var before: (()->())? { get set }
  var after: (()->())? { get set }
  
  func before(_ callback: @escaping ()->()) -> Self
  func after(_ callback: @escaping ()->()) -> Self
  func invokeBefore()
  func invokeAfter()
}

extension Chainable {
  
  @discardableResult
  func before(_ callback: @escaping ()->()) -> Self {
    before = callback
    return self
  }
  
  @discardableResult
  func after(_ callback: @escaping ()->()) -> Self {
    after = callback
    return self
  }
  
  func invokeBefore() {
    before?()
    before = nil
  }
  
  func invokeAfter() {
    after?()
    after = nil
  }
}
