//
//  ViewController.swift
//  Swift6WKWebView1
//
//  Created by 井戸春希 on 2021/02/22.
//

import UIKit
import WebKit

//WKNavigationDelegateのメソッドが使えるようにする
class ViewController: UIViewController,WKNavigationDelegate {
    
    @IBOutlet weak var indicater: UIActivityIndicatorView!

    @IBOutlet weak var toolBar: UIToolbar!
    
    var webveiw = WKWebView()
    
    //遷移先で値を受け取るための変数
    var type :Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicater.isHidden = true
        
        //webviewの大きさを決めていく
        webveiw.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        
        //controllerのviewにwebviewを貼り付ける
        view.addSubview(webveiw)
        
        //navigationDelegatを使うための記述
        webveiw.navigationDelegate = self
        
        //URLをロードする
        if type == 1{
            let url = URL(string: "https://www.youtube.com/?gl=JP&hl=ja")
            let request = URLRequest(url: url!)
            webveiw.load(request)
        }else if type == 2{
            let url = URL(string: "https://www.doshisha.ac.jp/")
            let request = URLRequest(url: url!)
            webveiw.load(request)
        }else{
            let url = URL(string: "https://www.amazon.co.jp/?&tag=hydraamazonav-22&ref=pd_sl_7ibq2d37on_e&adgrpid=56100363354&hvpone=&hvptwo=&hvadid=289260145877&hvpos=&hvnetw=g&hvrand=17546437043637627207&hvqmt=e&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1009564&hvtargid=kwd-10573980&hydadcr=27922_11415158&gclid=Cj0KCQiAhP2BBhDdARIsAJEzXlFLJGQb0Z6MpgLYxp3cZXgpdnb7InzZyx-3K0r1eb3XC6pFh4DzIxoaAvrrEALw_wcB")
            let request = URLRequest(url: url!)
            webveiw.load(request)
        }
        
        //webviewがindicaterの上にあるのを回避
        indicater.layer.zPosition = 2
        
    }
    
    //ロードが完了した時に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        //indicaterを隠すかどうかのプロパティ
        indicater.isHidden = true
        
        //indicaterを止めるメソッド
        indicater.stopAnimating()
    }
    
    //読み込みが開始した時に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        //indicaterを隠すかどうかのプロパティ
        indicater.isHidden = false
        
        //indicaterを動かすメソッド
        indicater.startAnimating()
    }

    @IBAction func back(_ sender: Any) {
        
        //前のページに戻る
        webveiw.goBack()
        
    }
    
    @IBAction func go(_ sender: Any) {
        
        //ページを進める
        webveiw.goForward()
    }
    
    
    @IBAction func home(_ sender: Any) {
        
        //ホームに戻る
        dismiss(animated: true, completion: nil)
    }
    
}

