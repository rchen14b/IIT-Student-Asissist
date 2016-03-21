import Foundation
import UIKit
import MessageUI

class Feedback : UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var body: UITextView!
    @IBOutlet var subject: UITextField!
    override func viewDidLoad() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
    view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
  
    @IBAction func sendEmail(sender: AnyObject) {
        var subjectText = "IIT Mobile Feedback: "
        subjectText += subject.text!
        let messageBody = body
        let toRecipients = ["szeinali@hawk.iit.edu"]
        
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(subjectText)
        mc.setMessageBody(messageBody.text, isHTML: false)
        mc.setToRecipients(toRecipients)
        
        self.presentViewController(mc, animated: true, completion: nil)
    }
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            NSLog("Mail Cancelled")
        case MFMailComposeResultSaved.rawValue:
            NSLog("Mail Saved")
        case MFMailComposeResultSent.rawValue:
            NSLog("Mail Sent")
        case MFMailComposeResultFailed.rawValue:
            NSLog("Mail Sent Failure:", [error!.localizedDescription])
        default:
            break
            
            
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}