import Foundation
import MapKit
import CoreLocation


class Maps : UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        self.revealViewController().revealToggleAnimated(true)
        

    }
    
    @IBOutlet var map: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        //Location
        self.map.delegate = self
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.map.showsUserLocation = true
        
        
        //Pin Coordinates
        
        let pin1 = CLLocationCoordinate2D(
            latitude:  41.839482, longitude: -87.629625
        )
        
        let point1 = MKPointAnnotation()
        point1.coordinate = pin1
        
        let pin2 = CLLocationCoordinate2D(
            latitude: 41.83953, longitude: -87.628208
        )
        
        
        let point2 = MKPointAnnotation()
        point2.coordinate = pin2
        
        
        let pin3 = CLLocationCoordinate2D(
            latitude:  41.839578, longitude: -87.62868
            
        )
        
        let point3 = MKPointAnnotation()
        point3.coordinate = pin3
        
        
        let pin4 = CLLocationCoordinate2D(
            latitude:  41.839594 , longitude: -87.627457
        )
        
        let point4 = MKPointAnnotation()
        point4.coordinate = pin4
        
        
        
        
        
        //  map.addAnnotation(point1)
        //  map.addAnnotation(point2)
        //  map.addAnnotation(point3)
        //  map.addAnnotation(point4)
        
        //Coordinates
        
        let nw = CLLocation(latitude: 41.839424, longitude: -87.629378)
        let ne = CLLocation(latitude: 41.839504, longitude: -87.623820)
        let sw = CLLocation(latitude: 41.831190, longitude: -87.629056)
        let se = CLLocation(latitude: 41.831222, longitude: -87.622125)
        
        var coordinate1 = [nw.coordinate, ne.coordinate]
        var coordinate2 = [sw.coordinate, nw.coordinate]
        var coordinate3 = [sw.coordinate, se.coordinate]
        var coordinate4 = [se.coordinate, ne.coordinate]
        
        let pl1 = MKGeodesicPolyline(coordinates: &coordinate1, count: 2)
        let pl2 = MKGeodesicPolyline(coordinates: &coordinate2, count: 2)
        let pl3 = MKGeodesicPolyline(coordinates: &coordinate3, count: 2)
        let pl4 = MKGeodesicPolyline(coordinates: &coordinate4, count: 2)
        
        map.addOverlay(pl1)
        map.addOverlay(pl2)
        map.addOverlay(pl3)
        map.addOverlay(pl4)
        
        
        
        
    }
    
    //Line Function
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else {
            return MKOverlayRenderer()
        }
        
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.lineWidth = 5.0
        renderer.alpha = 0.7
        renderer.strokeColor = UIColor.redColor()
        
        return renderer
    }
    
    //Location Function
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self.map.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }

}