import UIKit
var pageNum = 0 // 全局变量 用来记录当前显示视图的编号
class SecondSubViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageNum += 1   // 每当视图控制器被创建  全局变量自增1
        self.title = "Page \(pageNum)"   // 依据全局变量 设置标题
        self.view.backgroundColor = UIColor.purple
        
        let btPush = UIButton(frame: CGRect(x: 40, y: 200, width: 240, height: 30))  // 创建按钮
        btPush.setTitle("Push Page", for:UIControlState())
        btPush.backgroundColor = UIColor.orange

        btPush.addTarget(self, action: #selector(SecondSubViewController.pushPage), for:UIControlEvents.touchUpInside)
                self.view.addSubview(btPush)
        

        let btPop = UIButton(frame: CGRect(x: 40, y: 260, width: 240, height: 30))  // 创建按钮
        btPop.setTitle("Pop Page", for:UIControlState())
        btPop.backgroundColor = UIColor.orange
        
        btPop.addTarget(self, action: #selector(SecondSubViewController.popPage), for:UIControlEvents.touchUpInside)
        self.view.addSubview(btPop)
        
        
        // 跳转到指定序号的视图
        let btIndex = UIButton(frame: CGRect(x: 40, y: 320, width: 240, height: 30))  // 创建按钮
        btIndex.setTitle("Index Page", for:UIControlState())
        btIndex.backgroundColor = UIColor.orange
        
        btIndex.addTarget(self, action: #selector(SecondSubViewController.gotoIndexPage), for:UIControlEvents.touchUpInside)
        self.view.addSubview(btIndex)
        
       
        
        let btRoot = UIButton(frame: CGRect(x: 40, y: 380, width: 240, height: 30))  // 创建按钮
        btRoot.setTitle("Root Page", for:UIControlState())
        btRoot.backgroundColor = UIColor.orange
        
        btRoot.addTarget(self, action: #selector(SecondSubViewController.gotoRootPage), for:UIControlEvents.touchUpInside)
        self.view.addSubview(btRoot)
        
        
        
//        self.title = "Second Page"  // 设置当前试图控制器标题
//        self.view.backgroundColor = UIColor.purple
//        
//        let btHide = UIButton(frame: CGRect(x: 40, y: 200, width: 240, height: 30))  // 创建按钮
//        btHide.setTitle("Hide NavigationBar", for:UIControlState())
//        btHide.backgroundColor = UIColor.orange
//        btHide.addTarget(self, action: #selector(SecondSubViewController.hideNavigation), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(btHide)
//        
//        
//        let btHide1 = UIButton(frame: CGRect(x: 40, y: 260, width: 240, height: 30))  // 创建按钮
//        btHide1.setTitle("Hide ToolBar", for:UIControlState())
//        btHide1.backgroundColor = UIColor.orange
//        btHide1.addTarget(self, action: #selector(SecondSubViewController.hideTool), for: UIControlEvents.touchUpInside)
//            self.view.addSubview(btHide1)
//        
//        
//        let btHide2 = UIButton(frame: CGRect(x: 40, y: 320, width: 240, height: 30))  // 创建按钮
//        btHide2.setTitle("Open NavigationBar", for:UIControlState())
//        btHide2.backgroundColor = UIColor.orange
//        btHide2.addTarget(self, action: #selector(SecondSubViewController.openNavigation), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(btHide2)
//        
//        
//        
//        
//        let btHide3 = UIButton(frame: CGRect(x: 40, y: 380, width: 240, height: 30))  // 创建按钮
//        btHide3.setTitle("Open ToolBar", for:UIControlState())
//        btHide3.backgroundColor = UIColor.orange
//        btHide3.addTarget(self, action: #selector(SecondSubViewController.openTool), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(btHide3)
        
    }
    
    
    func gotoIndexPage() {
        let vc = self.navigationController?.viewControllers[2]
        // 跳转到该控制器
        self.navigationController?.popToViewController(vc!,animated: true)
    }
    
    func gotoRootPage() {
  self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    func popPage() {
        // 出栈操作
        self.navigationController?.popViewController(animated: true)
    }
    
    func pushPage() {
        let vc2 = SecondSubViewController()
        
        //入栈操作
        self.navigationController?.pushViewController(vc2, animated: true)
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
