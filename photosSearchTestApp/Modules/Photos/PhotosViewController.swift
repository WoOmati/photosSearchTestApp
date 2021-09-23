//
//  PhotosViewController.swift
//  photosSearchTestApp
//
//  Created by macbook on 15.09.2021.
//

import Kingfisher
import UIKit

class PhotosViewController: UIViewController {

    var searchPhrase: String = ""
    private let searchPhotosServise = SearchPhotosServise()
    @IBOutlet weak var tableView: UITableView!
    var images: [Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        searchPhotosServise.obtainPhotos(phrase: searchPhrase) { [weak self] response in
            if let response = response {
                self?.images = response.results
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
//        PhotosViewCell.self
        tableView.register(UINib(nibName: "PhotosViewCell", bundle: nil), forCellReuseIdentifier: "photoCell")
    }
}
extension PhotosViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotosViewCell
        let imageURL = URL(string: images[indexPath.row].imageUrl)
        cell.photoImageView?.kf.setImage(with: imageURL)
        return cell
    }
    
    
}
