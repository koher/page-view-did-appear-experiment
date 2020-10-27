import SwiftUI
import UIKit

struct PageView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PageViewController {
        PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func updateUIViewController(_ uiViewController: PageViewController, context: Context) {
    }
}

final class PageViewController: UIPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers(
            [UIHostingController(rootView: FooView(page: 0))],
            direction: .forward,
            animated: false,
            completion: nil
        )
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let page = (viewController as! UIHostingController<FooView>).rootView.page
        return UIHostingController(rootView: FooView(page: page - 1))
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let page = (viewController as! UIHostingController<FooView>).rootView.page
        return UIHostingController(rootView: FooView(page: page + 1))
    }
}
