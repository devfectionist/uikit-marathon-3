import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var animatedView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        
        return slider
    }()
    
    // MARK: - Overrides
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        let layoutMarginsGuide = view.layoutMarginsGuide
        
        view.addSubview(animatedView)
        let animatedViewConstraints = [
            animatedView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            animatedView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            animatedView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 64),
            animatedView.widthAnchor.constraint(equalToConstant: 100),
            animatedView.heightAnchor.constraint(equalTo: animatedView.widthAnchor)
        ]
        view.addConstraints(animatedViewConstraints)
        
        view.addSubview(slider)
        let sliderConstraints = [
            slider.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            slider.topAnchor.constraint(equalTo: animatedView.bottomAnchor, constant: 24)
        ]
        view.addConstraints(sliderConstraints)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider()
    }
    
    // MARK: - Private
    
    private func setupSlider() {
        slider.addTarget(self, action: #selector(sliderDidChange), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderDidEnd), for: .touchUpInside)
    }
    
    @objc
    private func sliderDidChange() {}
    
    @objc
    private func sliderDidEnd() {
        slider.value = slider.maximumValue
    }
}
