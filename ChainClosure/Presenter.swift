class Presenter {
  
  private let repository: Repository
  private weak var view: View?
  
  init(view: View, repository: Repository) {
    self.view = view
    self.repository = repository
  }
  
  func onViewDidLoad() {
    view?.showLoadingIndicator()
    
    repository
      .before({ [weak self] in self?.view?.hideLoadingIndicator() })
      .getItem(
        onSuccess: { title in print(title) },
        onError: { error in print(error.localizedDescription) })
      .after({ [weak self] in self?.action() })
  }
  
  func action() {
    //some logic after request
  }
}
