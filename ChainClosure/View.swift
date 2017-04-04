protocol IndicatorShowable {
  func showLoadingIndicator()
  func hideLoadingIndicator()
}

protocol View: class, IndicatorShowable {}
