//
//  ViewController.swift
//  PageCurlAnimation
//
//  Created by Marina Costa dos Santos on 15/05/25.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let customView = AnimationView()
    
    private var pageViewController: UIPageViewController!
    private let pageImages = ["bookCover", "bookOpen", "bookOpen"]
    private var currentIndex = 0
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpPageViewController()
    }
    
    func setUpPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        if let firstViewController = viewControllerAt(index: currentIndex) {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        addChild(pageViewController)
        customView.pageContainerView.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: customView.pageContainerView.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: customView.pageContainerView.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: customView.pageContainerView.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: customView.pageContainerView.trailingAnchor)
        ])
    }
    
    private func viewControllerAt(index: Int) -> UIViewController? {
        guard index >= 0 && index < pageImages.count else { return nil }
        
        let vc = UIViewController()
        let imageView = UIImageView(image: UIImage(named: pageImages[index]))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = vc.view.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.view.addSubview(imageView)
        vc.view.tag = index
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            let index = viewController.view.tag
            let previousIndex = index - 1
            return viewControllerAt(index: previousIndex)
        }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let index = viewController.view.tag
            let nextIndex = index + 1
            return viewControllerAt(index: nextIndex)
        }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                                didFinishAnimating finished: Bool,
                                previousViewControllers: [UIViewController],
                                transitionCompleted completed: Bool) {
            if completed, let currentVC = pageViewController.viewControllers?.first {
                currentIndex = currentVC.view.tag
            }
        }
    
}

#Preview {
    ViewController()
}


