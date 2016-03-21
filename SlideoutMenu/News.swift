import Foundation
class News : UIViewController {
    
    @IBOutlet var Web: UIWebView!
    //UIWeb directory 
    
    override func viewDidLoad() {
        let url = "http://web.iit.edu/"
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        Web.loadRequest(request)
    }

    @IBAction func backButtonTapped(sender: AnyObject) {
        print("Hello From the other side")
        self.revealViewController().revealToggleAnimated(true)
        
    }
}