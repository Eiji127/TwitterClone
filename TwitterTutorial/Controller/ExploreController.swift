import UIKit

class  ExploreCotroller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    func configureUI(){
        
        view.backgroundColor = .white
        navigationItem.title = "Explore"
        
    }
}
