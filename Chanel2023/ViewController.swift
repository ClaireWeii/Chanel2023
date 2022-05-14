//
//  ViewController.swift
//  Chanel2023
//
//  Created by Wei Pan on 2022/5/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //循環播放器要在viewDidLoad之前宣告，如果在viewDidLoad裡面宣告，當viewDidLoad內的程式跑完後，player就會被清掉造成音樂無法再次播放
    var looper: AVPlayerLooper?
    var particle = "date"
    //產生發射圖層
    let dateEmitterLayer = CAEmitterLayer()
    let locationEmitterLayer = CAEmitterLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let url = URL(string: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/b4/d3/ea/b4d3ea48-71c5-c3db-ea6a-02c134cc5067/mzaf_9371911637032292459.plus.aac.p.m4a"){
            
            //生成AVQueuePlayer物件
            let player = AVQueuePlayer()
            //利用AVPlayerItem生成要播的音樂網址
            let item = AVPlayerItem(url: url)
            //生成AVPlayerLooper，傳入剛剛生成的player&item。到時候AVPlayerLooper將讓item重覆播放
            looper = AVPlayerLooper(player: player, templateItem: item)
            player.play()
        }
            
            let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 812))
            backgroundImage.image = UIImage(named: "Beach")
            backgroundImage.contentMode = .scaleAspectFill
            let chanelImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 83))
            chanelImage.image = UIImage(named: "CHANEL")
            chanelImage.contentMode = .scaleAspectFill
            let pinkImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 83))
            pinkImage.backgroundColor = UIColor(red: 255/255, green: 20/255, blue: 174/255, alpha: 0.9)
            
            pinkImage.mask = chanelImage
            pinkImage.frame = CGRect(x: 0, y: 354.5, width: 375, height: 83)
            //insertSubView用來控制圖片添加到哪一層，因為background是要放在最底層，因此設定at: 0
            view.insertSubview(backgroundImage, at: 0)
            view.addSubview(pinkImage)
            
    }
            func dateEmitter(){
                //產生發射器
                let dateEmitterCell = CAEmitterCell()
                //設定要發射的內容
                dateEmitterCell.contents = UIImage(named: "5-5-22")?.cgImage
                //設定每秒產生多少date
                dateEmitterCell.birthRate = 6
                //設定date在畫面的停留時間
                dateEmitterCell.lifetime = 20
                //設定date移動的初始速度
                dateEmitterCell.velocity = 10
                //設定date移動速度的可變化量
                dateEmitterCell.velocityRange = 10
                //設定date下降的加速度
                dateEmitterCell.yAcceleration = 10
                dateEmitterCell.xAcceleration = 0
                //設定date的大小比例
                dateEmitterCell.scale = 1.4
                //設定date的大小比例可變化量
                dateEmitterCell.scaleRange = 1
                //設定date的大小在畫面中時的變化速度
                dateEmitterCell.scaleSpeed = -0.02
                //設定date的旋轉速度
                dateEmitterCell.spin = 0.5
                //設定date的旋轉速度可變化量
                dateEmitterCell.spinRange = 0.5
                //設定發射的角度
                dateEmitterCell.emissionRange = .pi*0.5
                
                //設定圖層上的內容
                dateEmitterLayer.emitterCells = [dateEmitterCell]
                //設定發射的中心位置
                dateEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width/2, y: -100)
                //設定發射的形狀大小
                dateEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
                //設定發射的形狀
                dateEmitterLayer.emitterShape = .line
                
                view.layer.addSublayer(dateEmitterLayer)
            }
            
            func locationEmitter(){
                let locationEmiterCell = CAEmitterCell()
                locationEmiterCell.contents = UIImage(named: "Monte-Carlo Monaco")?.cgImage
                locationEmiterCell.birthRate = 5
                locationEmiterCell.lifetime = 20
                locationEmiterCell.velocity = 20
                locationEmiterCell.velocityRange = 10
                locationEmiterCell.yAcceleration = 10
                locationEmiterCell.xAcceleration = 0
                locationEmiterCell.scale = 1.3
                locationEmiterCell.scaleRange = 0.5
                locationEmiterCell.scaleSpeed = -0.02
                locationEmiterCell.spin = 0.5
                locationEmiterCell.spinRange = 0.5
                locationEmiterCell.emissionRange = .pi
                
                locationEmitterLayer.emitterCells = [locationEmiterCell]
                locationEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width/2, y: -150)
                locationEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
                locationEmitterLayer.emitterShape = .line
                
                view.layer.addSublayer(locationEmitterLayer)
            }
    
    
    @IBAction func changeEmitter(_ sender: Any) {
        if particle == "date"{
            dateEmitter()
            locationEmitterLayer.removeFromSuperlayer()
            particle = "location"
        }else{
            locationEmitter()
            dateEmitterLayer.removeFromSuperlayer()
            particle = "date"
        }
    }
}

