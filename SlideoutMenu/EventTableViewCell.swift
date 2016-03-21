

import UIKit

class EventTableViewCell: UITableViewCell {


    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var body: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
