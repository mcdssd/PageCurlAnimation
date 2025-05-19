//
//  ViewController.swift
//  PageCurlAnimation
//
//  Created by Marina Costa dos Santos on 15/05/25.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let customView = AnimationView()
    
    private var pageController: UIPageViewController!
    private let pageImages = ["bookCover", "bookOpen", "bookOpen2", "bookOpen3"]
    private var currentIndex = 0
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpPageViewController()
    }
    
    func setUpPageViewController() {
        pageController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        
        pageController.dataSource = self
        pageController.delegate = self
        
        if let firstViewController = viewControllerAt(index: currentIndex) {
            pageController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        addChild(pageController)
        customView.pageContainerView.addSubview(pageController.view)
        pageController.didMove(toParent: self)
        
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageController.view.topAnchor.constraint(equalTo: customView.pageContainerView.topAnchor),
            pageController.view.bottomAnchor.constraint(equalTo: customView.pageContainerView.bottomAnchor),
            pageController.view.leadingAnchor.constraint(equalTo: customView.pageContainerView.leadingAnchor),
            pageController.view.trailingAnchor.constraint(equalTo: customView.pageContainerView.trailingAnchor)
        ])
    }
    
    private func viewControllerAt(index: Int) -> UIViewController? {
        guard index >= 0 && index < pageImages.count else { return nil }
        
        let vc = UIViewController()
        
        
        let imageView = UIImageView(image: UIImage(named: pageImages[index]))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: vc.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor)
        ])
        
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


