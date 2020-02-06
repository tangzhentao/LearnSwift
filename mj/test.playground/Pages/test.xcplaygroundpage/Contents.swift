import UIKit

var str = "Hello, playground"

var i = 10


// 显示view
import PlaygroundSupport
let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.backgroundColor = UIColor.red
PlaygroundPage.current.liveView = view

// 显示图片
let imageView = UIImageView(image: UIImage(named: "logo"))
PlaygroundPage.current.liveView = imageView

// 传递控制器
let vc = UITableViewController()
vc.view.backgroundColor = UIColor.gray
PlaygroundPage.current.liveView = vc


