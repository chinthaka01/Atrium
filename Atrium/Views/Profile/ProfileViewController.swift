//
//  ProfileViewController.swift
//  Atrium
//
//  View of the user profile.
//
//  Created by Chinthaka Perera on 2021-03-11.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewControllerDelegate {
    
    /**
     *  Value of the space between 2 sections.
     */
    let space: CGFloat = 10
    
    /**
     *  The sections of the page is added to this scroll view since the page need to be scrolled to view all of them.
     */
    var scrollView: UIScrollView!
    var headerView: ProfileHeaderView!
    var pinnedRepositoriesSectionView: PinnedRepositoriesSectionView!
    var topRepositoriesSectionView: TopRepositoriesSectionView!
    var starredRepositoriesSectionView: StarredRepositoriesSectionView!
    
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    let profilePresenter = ProfilePresenter(profileRetriever: ProfileRetriever())
    
    /** User ID has been hard coded since we are showing the profile page directly without selecting that dynamically. */
    let userId: String = "benjamn"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        animateSpinner()
        
        profilePresenter.setProfileViewControllerDelegate(profileViewControllerDelegate: self)
        
        DispatchQueue.main.async {
            
            self.addSrollView()
            self.addHeaderSectionView()
            self.addPinnedRepositoriesSectionView()
            self.addTopRepositoriesSectionView()
            self.addStarredRepositoriesSectionView()
            
            self.setSrollContentSize()
            
            self.view.bringSubviewToFront(self.spinner)
            
            DispatchQueue.global(qos: .background).async {
                self.profilePresenter.getProfile(userId: self.userId)
                DispatchQueue.main.async {
                    self.spinner.stopAnimating()
                }
            }
        }
    }
    
    /**
     *  Adding scroll view to the view since we need to scroll the view content.
     */
    func addSrollView() {
        scrollView = UIScrollView()
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.refreshControl = UIRefreshControl();
        scrollView.refreshControl?.addTarget(self, action: #selector(refreshProfile), for: .valueChanged)
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    /**
     *  Adding the header to show the user data.
     */
    func addHeaderSectionView() {
        headerView = ProfileHeaderView()
        
        headerView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(headerView)

        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerView.heightAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.33)
        ])
        
        headerView.layoutIfNeeded()
    }

    /**
     *  Adding the view to show the pinned repositories.
     */
    func addPinnedRepositoriesSectionView() {
        pinnedRepositoriesSectionView = PinnedRepositoriesSectionView()
        
        pinnedRepositoriesSectionView.translatesAutoresizingMaskIntoConstraints = false
        pinnedRepositoriesSectionView.backgroundColor = .purple
        
        scrollView.addSubview(pinnedRepositoriesSectionView)

        NSLayoutConstraint.activate([
            pinnedRepositoriesSectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: space),
            pinnedRepositoriesSectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            pinnedRepositoriesSectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            pinnedRepositoriesSectionView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.66)
        ])
        
        pinnedRepositoriesSectionView.layoutIfNeeded()
    }

    /**
     *  Adding the view to show the top repositories.
     */
    func addTopRepositoriesSectionView() {
        topRepositoriesSectionView = TopRepositoriesSectionView()
        
        topRepositoriesSectionView.translatesAutoresizingMaskIntoConstraints = false
        topRepositoriesSectionView.backgroundColor = .black

        scrollView.addSubview(topRepositoriesSectionView)

        NSLayoutConstraint.activate([
            topRepositoriesSectionView.topAnchor.constraint(equalTo: pinnedRepositoriesSectionView.bottomAnchor, constant: space),
            topRepositoriesSectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topRepositoriesSectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            topRepositoriesSectionView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.33)
        ])
        
        topRepositoriesSectionView.layoutIfNeeded()
    }

    /**
     *  Adding the view to show the starred repositories.
     */
    func addStarredRepositoriesSectionView() {
        starredRepositoriesSectionView = StarredRepositoriesSectionView()
        
        starredRepositoriesSectionView.translatesAutoresizingMaskIntoConstraints = false
        starredRepositoriesSectionView.backgroundColor = .darkGray

        scrollView.addSubview(starredRepositoriesSectionView)

        NSLayoutConstraint.activate([
            starredRepositoriesSectionView.topAnchor.constraint(equalTo: topRepositoriesSectionView.bottomAnchor, constant: space),
            starredRepositoriesSectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            starredRepositoriesSectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            starredRepositoriesSectionView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.33)
        ])
        
        starredRepositoriesSectionView.layoutIfNeeded()
    }
    
    /**
     *  Animate the spinner.
     */
    func animateSpinner() {
        if (spinner.superview == nil) {
            spinner.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(spinner)
            
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        
        spinner.startAnimating()
    }
    
    /**
     *  Hide the animating spinner on the view.
     */
    func hideSpinner() {
        if spinner.isAnimating {
            spinner.stopAnimating()
            view.sendSubviewToBack(spinner)
        }
    }
    
    /**
     *  This is involked by the refresh controller of the scroll view after the user pulled to refresh the content.
     */
    @objc func refreshProfile() {
        animateSpinner()
        view.bringSubviewToFront(self.spinner)
        
        DispatchQueue.global(qos: .background).async {
            self.profilePresenter.getProfile(userId: self.userId)

            // Dismiss the refresh control.
            DispatchQueue.main.async {
                 self.scrollView.refreshControl?.endRefreshing()
            }
        }
    }
    
    /**
     *  Set the content size of te scroll view by considering the content UIs of that.
     */
    func setSrollContentSize() {
        let contentHeight =
            headerView.frame.height +
            pinnedRepositoriesSectionView.frame.height +
            topRepositoriesSectionView.frame.height +
            starredRepositoriesSectionView.frame.height +
            space * 3

        scrollView.contentSize = CGSize(width: view.frame.width, height: contentHeight)
    }
    
    /**
     *  ProfileViewControllerDelegate functions.
     */
    
    func displayProfile(user: GetProfileDataQuery.Data.User?) {

        if user != nil {
            headerView.feedUIComponents(user: user!, userId: userId)
            pinnedRepositoriesSectionView.feedUIComponents(user: user!, userId: nil)
            topRepositoriesSectionView.feedUIComponents(user: user!, userId: nil)
            starredRepositoriesSectionView.feedUIComponents(user: user!, userId: nil)
        }

        hideSpinner()
    }
}


