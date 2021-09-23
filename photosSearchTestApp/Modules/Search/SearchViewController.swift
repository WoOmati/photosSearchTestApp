import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchText: UITextField!
    
    private var searchPhrase = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func search(_ sender: Any) {
        performSegue(withIdentifier: "showPhotos", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PhotosViewController
        let searchPhrase = searchText.text
        vc.searchPhrase = searchPhrase!
    }
}
