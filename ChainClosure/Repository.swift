final class Repository: Chainable {
  
  var before: (()->())?
  
  func getItem(onSuccess: @escaping (String)->(), onError: @escaping (Error)->()) {
    //some background async request
    DispatchQueue.main.async {
      self.invoke()
      if arc4random_uniform(2) == 0 {
        onSuccess("title")
      } else {
        onError(ErrorImp())
      }
    }
  }
}

class ErrorImp: Error { }
