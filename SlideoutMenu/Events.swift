import Foundation
import Alamofire
import SwiftyJSON

extension String {
    func dateFromString() -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.dateFromString(self)
    }
}

extension Array {
    func objectAt(index: Int) -> Element? {
        return index < self.count ? self[index] : nil
    }
}

let requestURL = "https://clients6.google.com/calendar/v3/calendars/calendar@iit.edu/events?calendarId=calendar%40iit.edu&singleEvents=true&timeZone=America%2FChicago&maxAttendees=1&maxResults=250&sanitizeHtml=true&timeMin=2015-12-06T00%3A00%3A00-06%3A00&timeMax=2015-12-31T00%3A00%3A00-06%3A00&key=AIzaSyBNlYH01_9Hc5S1J9vuFmu2nUqBZJNAXxs"

class Event {
    let description: String
    var startDate: NSDate = NSDate()
    var endDate: NSDate = NSDate()
    let summery: String
    let htmlLink: NSURL?
    let displayName: String
    
    init(description: String, startDate: String, endDate:String, summery: String, htmlLink: NSURL?, displayName:String) {
        self.description = description
        if let startDate = startDate.dateFromString(), endDate = endDate.dateFromString() {
            self.startDate = startDate
            self.endDate = endDate
        }
        
        self.summery = summery
        self.htmlLink = htmlLink
        self.displayName = displayName
    }
    
    
    
}

extension UIViewController {
    func getBackFromReveal() {
        self.revealViewController().revealToggleAnimated(true)
    }
}



class Events : UITableViewController {
    var eventsArray : [Event]?
    
    func fetchEvents() {
        self.eventsArray = [Event]()
        Alamofire.request(.GET, requestURL, parameters: nil)
            .response { request, response, data, error in
                let jsonResult = JSON(data: data!)
                for x in jsonResult["items"] {
                    let js = x.1
                    let description = js["description"].stringValue
                    let startDate = js["start"]["date"].stringValue
                    let endDate = js["end"]["date"].stringValue
                    let summery = js["summery"].stringValue
                    let organizer = js["organizer"]["displayName"].stringValue
                    let htmlLink = NSURL(string: js["htmlLink"].stringValue)
                    let event = Event(description: description, startDate: startDate, endDate: endDate, summery: summery, htmlLink: htmlLink, displayName: organizer)

                    self.eventsArray?.append(event)
                }
                self.tableView.reloadData()
        }

    }
    
    override func viewDidLoad() {
        self.tableView.registerNib(UINib(nibName: "EventTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "EventCell")
        fetchEvents()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray?.count ?? 0
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventTableViewCell
        if let x = eventsArray?.objectAt(indexPath.row) {
            cell.eventNameLabel.text = x.displayName
            cell.eventDate.text = "from:\(x.startDate.description)to: \(x.endDate.description)"
            cell.body.text = x.description
            cell.body.textColor = UIColor.darkGrayColor()
        }
        return cell
        
    }
    
    
    @IBAction func backTapped(sender: AnyObject) {
        self.getBackFromReveal()
        
    }
}