class ViewController: UIViewController, View {
  
  private var presenter: Presenter!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    presenter = Presenter(view: self, repository: Repository())
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.onViewDidLoad()
  }

  func showLoadingIndicator() {}
  func hideLoadingIndicator() {}
}

