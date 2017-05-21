import UIKit

class SecondSubViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Second Page"  // 设置当前试图控制器标题         
        self.view.backgroundColor = UIColor.purple
        
        let btHide = UIButton(frame: CGRect(x: 40, y: 200, width: 240, height: 30))  // 创建按钮
        btHide.setTitle("Hide NavigationBar", for:UIControlState())
        btHide.backgroundColor = UIColor.orange
        btHide.addTarget(self, action: #selector(SecondSubViewController.hideNavigation), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btHide)
        
        
        let btHide1 = UIButton(frame: CGRect(x: 40, y: 260, width: 240, height: 30))  // 创建按钮
        btHide1.setTitle("Hide ToolBar", for:UIControlState())
        btHide1.backgroundColor = UIColor.orange
        btHide1.addTarget(self, action: #selector(SecondSubViewController.hideTool), for: UIControlEvents.touchUpInside)
            self.view.addSubview(btHide1)
        
        
        let btHide2 = UIButton(frame: CGRect(x: 40, y: 320, width: 240, height: 30))  // 创建按钮
        btHide2.setTitle("Open NavigationBar", for:UIControlState())
        btHide2.backgroundColor = UIColor.orange
        btHide2.addTarget(self, action: #selector(SecondSubViewController.openNavigation), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btHide2)
        
        
        
        
        let btHide3 = UIButton(frame: CGRect(x: 40, y: 380, width: 240, height: 30))  // 创建按钮
        btHide3.setTitle("Open ToolBar", for:UIControlState())
        btHide3.backgroundColor = UIColor.orange
        btHide3.addTarget(self, action: #selector(SecondSubViewController.openTool), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btHide3)
        
    }
    
    func hideTool() {
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
    
    func hideNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func openTool() {
        self.navigationController?.setToolbarHidden(false, animated: true)
    }
    
    
    func openNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
