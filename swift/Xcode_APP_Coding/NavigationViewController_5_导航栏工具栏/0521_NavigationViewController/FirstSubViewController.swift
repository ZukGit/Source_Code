
import UIKit


class FirstSubViewController: UIViewController {
    
    // 视图即将可见 时  执行该方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  self.navigationController?.setToolbarHidden(false, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "First Page"  // 设置当前试图控制器 在选项卡视图控制器中的标题
        self.view.backgroundColor = UIColor.brown
        
        
        // 设置右上角 导航按钮的按钮功能和样式  点击时跳转到第二个视图控制器
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self,action: #selector(FirstSubViewController.nextPage))
        

        
    }
    
    
    func nextPage() {
        print("nextPage")
         let vc2 = SecondSubViewController(); // 初始化第二个视图控制器
        
        // 将第二个视图控制器压入 导航视图控制器 ，实现界面跳转
        self.navigationController?.pushViewController(vc2, animated: true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
