import Foundation

class ContactUs : UIViewController {
    
    
    @IBOutlet var rest: UILabel!
    @IBOutlet var Label: UILabel!
    
    @IBOutlet var george: UILabel!
    
    @IBOutlet var header: UILabel!
    @IBOutlet var developer: UILabel!
    @IBOutlet var Lead: UILabel!
    override func viewDidLoad() {
        
        
        // titLabel.textColor = UIColor.redColor()
        
        // titLabel.text = "IIT Mobile"
        
        header.text = "OUR TEAM"
        Lead.text = "Lead Developer"
        Label.text = "George Miro\n\nSahand Zeinali\n\nRuiyang Chen"
        developer.text = "Developers"
        george.text = "Alaa Alali\n\nWenqing Ye"
        
        rest.text  = "\n\n\n\n\t\tContact Info: szeinali@hawk.iit.edu"
        
        /* \t\t\t\t\t\tDesigners:\n\t\t\t\t\t\tRuiyang Chen\n\t\t\t\t\t\tWenqing Ye\n\t\t\t\t\t\tAlaa Alali\n\n\n\n\n\n\n\n\n\n\n\n\ = n\n\n\n\nContact Us at:\t\t\t szeinali@hawk.iit.edu"*/
        
        header.textColor = UIColor.redColor()
        UIView.animateWithDuration(1, delay: 1.1, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: ({ self.header.center.x = self.view.frame.width/25}), completion: nil)
        
        
        UIView.animateWithDuration(1, delay: 1.1, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: ({ self.Label.center.x = self.view.frame.width/7}), completion: nil)
        
        
        UIView.animateWithDuration(1, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: ({ self.Lead.center.x = self.view.frame.width/7}), completion: nil)
        
        
        UIView.animateWithDuration(1, delay: 1.2, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: ({ self.developer.center.x = self.view.frame.width/7}), completion: nil)
        
        
        george.textColor = UIColor.grayColor()
        UIView.animateWithDuration(1, delay: 1.3, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: ({ self.george.center.x = self.view.frame.width/7}), completion: nil)
        
        
        rest.textColor = UIColor.grayColor()
        UIView.animateWithDuration(1, delay: 1.4, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: ({ self.rest.center.x = self.view.frame.width/0.5}), completion: nil)
        
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    /*
    override func viewDidAppear(animated: Bool) {
    UIView.animateWithDuration(0.5, delay: 0.3, options: [], animations: {
    self.Label.center.x += self.view.bounds.width
    }, completion: nil)
    }
    override func viewWillAppear(animated: Bool) {
    Label.center.x  -= view.bounds.width
    }
    */
    //change status bar color
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
        // return UIStatusBarStyle.Default
    }
}