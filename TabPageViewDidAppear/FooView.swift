import SwiftUI
import UIKit

struct FooView: UIViewControllerRepresentable {
    let page: Int
    
    func makeUIViewController(context: Context) -> FooViewController {
        let viewController = FooViewController()
        viewController.page = page
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: FooViewController, context: Context) {
    }
}

final class FooViewController: UIViewController {
    var page: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Foo: \(page.description)"
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear: \(page.description)")
    }
}
