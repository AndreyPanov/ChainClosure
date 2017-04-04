final class Repository: Chainable {
  
  var before: (()->())?
  var after: (()->())?
  
  func getItem(onSuccess: @escaping (String)->(), onError: @escaping (Error)->()) -> Self {
    //some background async request
    DispatchQueue.main.async {
      self.invokeBefore()
      if arc4random_uniform(2) == 0 {
        onSuccess("title")
      } else {
        onError(ErrorImp())
      }
      self.invokeAfter()
    }
    return self
  }
}

class ErrorImp: Error { }
