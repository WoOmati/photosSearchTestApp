//
//  ViewController.swift
//  photosSearchTestApp
//
//  Created by macbook on 15.09.2021.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchText: UITextField!
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchPhrase = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupSearchBar()
    }
//    private func setupSearchBar() {
//        navigationItem.searchController = searchController
//        searchController.searchBar.delegate = self
//    }

    @IBAction func search(_ sender: Any) {
        performSegue(withIdentifier: "showPhotos", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PhotosViewController
        let searchPhrase = searchText.text
        vc.searchPhrase = searchPhrase!
    }
//}
//extension SearchViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchPhrase = searchText
//    }
}
