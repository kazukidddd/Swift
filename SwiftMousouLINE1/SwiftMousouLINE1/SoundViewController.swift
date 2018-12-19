//
//  SoundViewController.swift
//  SwiftMousouLINE1
//
//  Created by 木村和貴 on 2018/12/18.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var imageView2: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //画面がはじめに表示されたときに非表示にしておく
        imageView2.isHidden = true
        
        //ラベルを非表示
        timeLabel.isHidden = true
        
        //音声(callMusic.mp3)を再生する
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3"){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
            }catch{
                //プレイヤー作成失敗
                //その場合は、プレイヤーをnilとする
                audioPlayer = nil
            }
        }else{
            // urlがnilなので再生できない
            fatalError("Url id nil.")
        }
        
    }
    
    
    @IBAction func tap(_ sender: Any) {
        //imageView2の非表示を表示に変える
        imageView2.isHidden = false
        
        //timeLabelの非表示を表示に変える
        timeLabel.isHidden = false
        
        //タイマーをスタートさせてtimeLabelへ秒数を表示する
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timercountUp), userInfo: nil, repeats: true)
        
        
        
        //baby.mp3の音声を再生する
        playBabySound()
        
        
    }
    
    func playBabySound(){
        //baby.mp3の音声を再生する
        if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3"){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf:url)
                audioPlayer?.play()
            }catch{
                //プレイヤー作成失敗
                //その場合は、プレイヤーをnilとする
                audioPlayer = nil
            }
        }else{
            //urlがnilなので再生できない
            fatalError("Url is nil.")
        }
    }
    
    @objc func timercountUp(){
        
        count = count + 1
         timeLabel.text = String(count)
    }
    
    @IBAction func deny(_ sender: Any) {
        //電話を切る
        
        
        //音声(callMusic.mp3)をstopさせる
        audioPlayer.stop()
        
        //画面をViewControllerへ戻す(遷移させる) dissmiss
        dismiss(animated: true, completion: nil)
    }
    

}
