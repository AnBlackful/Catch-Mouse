import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    
    var notClimbFieldX:CGFloat = 0
    var notClimbFieldY:CGFloat = 0
    var changeMousePlaceTimer = Timer()
    var counter = 0
    let minTime = 1.5
    let maxTime = 2.0
    let buttonSize:CGFloat = 50
    var button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonParameters()
        self.setSizes()
        self.showMouse()
        self.playGame()
    }
    
    @IBAction func mouseButtonPressed(_ sender: UIButton) {
        self.counter+=1
        self.counterLabel.text = String(self.counter)
        showMouse()
    }
    
    func playGame(){
//        self.changeMousePlaceTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Double.random(in: minTime ..< maxTime)), target: self, selector: #selector(showMouse), userInfo: nil, repeats: true)
    }
    
    @objc func showMouse(){
        self.button.frame.origin.x = randomX()
        self.button.frame.origin.y = randomY()
    }
    
    
    func randomX() -> CGFloat{
        return CGFloat.random(in: 0 ..< self.notClimbFieldX)
    }
    
    func randomY() -> CGFloat{
        return CGFloat.random(in: 0 ..< self.notClimbFieldY)
    }
    
    func buttonParameters(){
        self.button.setBackgroundImage(#imageLiteral(resourceName: "mouse"), for: .normal)
        self.button.addTarget(self, action: #selector(mouseButtonPressed), for: .touchUpInside)
        self.button.contentMode = .scaleAspectFill
        self.button.clipsToBounds = true
        self.view.addSubview(button)
        
        self.button.layer.cornerRadius = 25
        self.button.layer.borderWidth = 2
        self.button.layer.borderColor = (UIColor( red: 0.7, green: 0.5, blue:0.2, alpha: 1.0 )).cgColor
    }
    
    func setSizes(){
        self.notClimbFieldX = self.view.frame.width - self.button.frame.width
        self.notClimbFieldY = (self.view.frame.height - self.button.frame.height - 20)
//        self.button.layer.zPosition = 1
    }
}

