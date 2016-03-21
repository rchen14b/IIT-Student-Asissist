
import Foundation

class Home : UIViewController {
    @IBOutlet var mobile: UILabel!
    @IBOutlet var welcome: UILabel!
    @IBOutlet var manual: UILabel!
    override func viewDidLoad() {
       //Home Page Labels
        self.welcome.alpha = 0
        self.mobile.alpha = 0

        self.manual.alpha = 0

        
        
        
        welcome.text = "Welcome to"
        
        mobile.text = "IIT Mobile"
        
        manual.text = "Slide to the Right"
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    //Animations
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UILabel.animateWithDuration(2.0, animations: {
            self.welcome.alpha = 1.0
            })
        
        UILabel.animateWithDuration(2.0, animations: {
            self.mobile.alpha = 1.0
        })
        
        UILabel.animateWithDuration(2.7, delay:0, options: [.Repeat, .Autoreverse], animations: {
            
            self.manual.alpha = 1.0
            
            }, completion: nil)
    
        
    }
    //change status bar color
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
        // return UIStatusBarStyle.Default
    }
}