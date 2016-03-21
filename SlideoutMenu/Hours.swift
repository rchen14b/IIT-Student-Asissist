import Foundation
import UIKit
import MapKit
import CoreLocation

class Hours : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    var pickerTime: [String] = [String]()
    var pickerlat: [Double] = [Double]()
    var pickerlog: [Double] = [Double]()
    var currentlat: Double = 41.836
    var currentlog: Double = -87.626631
    
    @IBOutlet weak var time: UILabel!
    override func viewDidLoad() {
        let initialLocation = CLLocation(latitude: currentlat, longitude: currentlog)
        self.picker.delegate = self;
        self.picker.dataSource = self;
        pickerData = ["Buildings","Alumni Memorial", "S. R. Crown Hall", "Life Sciences","Engineering One" ,"Perlstein Hall", "Siegel Hall", "Stuart Building", "Wishnick Hall", "Keating Sports Center", "Galvin Library", "Hermann Hall (HUB)", "McCormick Tribune Campus Center"]
        pickerTime = ["","Monday-Friday: 10:00AM-9:00PM\nSaturday-Sunday: closed",
            "Monday-Friday: 8:00AM-6:00PM\nSaturday-Sunday: 9:00AM-3:00PM",
            "Monday-Friday: 8:00AM-10:00PM\nSaturday-Sunday: 9:00AM-3:00PM",
            "Monday-Friday: 8:00AM-10:00PM\nSaturday-Sunday: 9:00AM-3:00PM",
            "Monday-Friday: 8:00AM-10:00PM\nSaturday-Sunday: 9:00AM-3:00PM",
            "Monday-Friday: 8:00AM-10:00PM\nSaturday-Sunday: 9:00AM-3:00PM",
            "Monday-Friday: 8:00AM-12:00AM\nSaturday-Sunday: 10:00AM-12:00AM",
            "Monday-Friday: 8:00AM-10:00PM\nSaturday-Sunday: 9:00AM-3:00PM",
            "Monday-Friday: 10:00AM-10:00PM\nSaturday: 10:00AM-6:00PM\nSunday: 10:00AM-3:00PM",
            "Monday-Thursday: Open 24 hours\nFriday: 12:00 AM-7:00PM\nSaturday: 8:30AM-5:00PM\nSunday:12:00PM-12:00AM",
            "Monday-Friday: 8:00AM-8:00PM\nSaturday-Sunday: 9:00AM-3:00PM",
            "Monday-Friday: 8:00AM-8:00PM\nSaturday-Sunday: 9:00AM-3:00PM"]
        pickerlat = [41.835235,41.836178,41.833205,41.837905,41.837026,41.835507,41.834260,41.838656,41.835091,41.838752,41.833700,41.835667,41.835459]
        pickerlog = [-87.625322,-87.626953,-87.627103,-87.627039,-87.627060,-87.627125,-87.627618,-87.627082,-87.627726,-87.625537,-87.628280,-87.628284,-87.625880]
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        centerMapOnLocation(initialLocation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        return myTitle
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let initialLocation = CLLocation(latitude: currentlat, longitude: currentlog)
        time.text = pickerTime[row]
        currentlat = pickerlat[row]
        currentlog = pickerlog[row]
        centerMapOnLocation(initialLocation)
    }
    //add the location of the map
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        //let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 1.0, regionRadius * 1.0)
        //mapView.setRegion(coordinateRegion, animated: true)
        mapView.mapType = .SatelliteFlyover
        mapView.showsBuildings = true
        //print(currentlat)
        //print(currentlog)
        let location = CLLocationCoordinate2D(latitude: currentlat, longitude: currentlog)
        let altitude: CLLocationDistance  = 200
        let heading: CLLocationDirection = 0    //0 degree is the north
        let pitch = CGFloat(45)
        let camera = MKMapCamera(lookingAtCenterCoordinate: location, fromDistance: altitude, pitch: pitch, heading: heading)
        mapView.setCamera(camera, animated: true)
    }
    //change status bar color
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
        // return UIStatusBarStyle.Default
    }
}