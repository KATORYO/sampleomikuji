//
//  ViewController.swift
//  sampleOmikuji
//
//  Created by 加藤諒 on 2017/08/31.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var myImageView: UIImageView!
  @IBOutlet weak var mymyView: UIImageView!
  @IBOutlet weak var mymymyView: UIImageView!

  
  //
  //占いの結果を配列で用意（メンバ変数）
  var omikuji = ["日本食","ローカル","パン屋","フィリピンレストラン","韓国料理","なし","水"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  //占いボタンが押された時
  @IBAction func tapUranai(_ sender: UIButton) {
    
    //占いの結果をランダムに選ぶための数字を作成(0から6しか出てこない)
    let r = Int(arc4random()) % omikuji.count
    
    //部品となるアラートを作成
    let alert = UIAlertController(title: "なにを食べる？？", message: omikuji[r],preferredStyle: .alert)
    
    //画像の配列定義
    var gazou = ["Image","Image-1","Image-2","Image-3"]
    var kin = Int( arc4random()) % gazou.count
    
    //アラートにOKボタンを追加
    //handler:OKボタンが押されたときに行いたい処理を指定する場所
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
    
      if r == 0{
        self.myImageView.image = UIImage(named: "Image")
      }else if r == 1{
        self.myImageView.image = UIImage(named: "Image-1")
      }else if r == 2{
        self.myImageView.image = UIImage(named: "Image-2")
      }else if r == 3{
        self.myImageView.image = UIImage(named: "Image-3")
      }else if r == 4{
        self.myImageView.image = UIImage(named: "Image-4")
      }else if r == 5{
        self.myImageView.image = UIImage(named: "Image-5")
      }else if r == 6{
        self.myImageView.image = UIImage(named: "Image-6")
      }
    }))
    
    
  
    //self.myImageView.image = UIImage(named: "Image")}))
    
    
    let layer:CALayer = self.myImageView.layer
    let animation:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
    animation.toValue = M_PI / 2.0
    animation.duration = 3.0           // 1.8秒で90度回転
    animation.repeatCount = MAXFLOAT;   // 無限に繰り返す
    animation.isCumulative = true;         // 効果を累積
    layer.add(animation, forKey: "ImageViewRotation")
  
  
    //アラートを表示する
    present(alert,animated: true,completion: nil)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

