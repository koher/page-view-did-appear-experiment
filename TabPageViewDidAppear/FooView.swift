import SwiftUI
import UIKit

struct FooView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> FooViewController {
        FooViewController()
    }
    
    func updateUIViewController(_ uiViewController: FooViewController, context: Context) {
    }
}

final class FooViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Foo"
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
}
