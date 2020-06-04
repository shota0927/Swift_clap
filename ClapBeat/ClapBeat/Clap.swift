//
//  Clap.swift
//  ClapBeat
//
//  Created by Shota Numa on 6/4/2 R.
//  Copyright © 2 Reiwa Shota Numa. All rights reserved.
//

import UIKit
import AudioToolbox

class Clap: NSObject {
    
    var soundURL = NSURL()
    //サウンドIDを生成
    var soundID = SystemSoundID()
    
    func setSound() {
        //ファイルを読み込んで、soundURLを生成
        let mainBundle = CFBundleGetMainBundle()
        soundURL = CFBundleCopyResourceURL(mainBundle, "clap" as CFString?, "wav" as CFString?, nil)
        //soundURLをもとに、soundIDを生成
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
    }
        
    //soundIDを再生
    func play() {
        AudioServicesPlaySystemSound(soundID)
    }
    
    // ▼▼ 追加 ▼▼
    //while文による繰り返し
    func repeatClap(count: Int) {
        var i = 0
        //while文を使って、countの回数分だけ繰り返し
        while(i < count) {
            //音を再生
            self.play()
            //iの値を1つ増やす
            i = i + 1
            //0.5秒（500000マイクロ秒）静止
            usleep(500000);
        }
    }
    
    //初期化処理
    override init() {
        super.init()
        setSound()
    }

}


