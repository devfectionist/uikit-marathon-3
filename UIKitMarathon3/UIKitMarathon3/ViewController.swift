import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    // MARK: - Overrides
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
