import UIKit

class ViewController: UIViewController {

    @IBOutlet var Label: UILabel!
    @IBOutlet var Open: UIBarButtonItem!
    
    var varView = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if (varView == 0){
            Label.text = "Strings"
            
        }
        else {
            
            Label.text = "Others"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

