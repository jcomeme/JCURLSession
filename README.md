# JCURLSession
Very easy and simple URLSession wrapper.

シンプルで簡単なURLSessionのラッパー。簡単なHTTP通信ができる。難しいライブラリはよう使わんという人向けです。

## Usage

### Preparation

Inherit JCURLSessionDelegate to your ViewController.
```
class SampleViewController: UIViewController, JCURLSessionDelegate {
```

Add delegate methods of JCURLSessionDelegate to your ViewController.
```
    func didReceiveDataAsString(_ string: String) {
        print(string)
    }

    func didReceiveError(_ error: String){
        print(error)
    }

    func didReceiveData(_ data: Data) {
        /*
        if let img = UIImage(data:data){
            imageView.image = img
        }else{
            print("This is not picture")
        }
        */
    }

    func downloadProgress(_ progress: (Int64, Int64)) {
        print("Download progress is \(progress.0)/\(progress.1)")
    }
```

Initialize JCURLSession object with delegate.
```
override func viewDidLoad() {
        super.viewDidLoad()
        let jcsession = JCURLSession(delegate: self)

```

### Data task

Call `cURL(_url:)` method.
```
jcsession.cURL("https://example.com/index.html")
```

Receive string with delegate method `didReceiveDataAsString(_ string: String)`.
```
func didReceiveDataAsString(_ string: String) {
    print(string)
}
```


### Download task

Call `wget(_url:)` method.
```
jcsession.wget("https://example.com/example.jpg")
```

Receive data with delegate method `didReceiveData(_ data: Data)`.
```
    func didReceiveData(_ data: Data) {
        if let img = UIImage(data:data){
            imageView.image = img
        }else{
            print("This is not picture")
        }
    }
```

You can get download progress with delegate method `downloadProgress(_ progress: (Int64, Int64))`.
```
    func downloadProgress(_ progress: (Int64, Int64)) {
        print("Download progress is \(progress.0)/\(progress.1)")
    }
```

### Error

You may receive error with delegate method `didReceiveError(_ error: String)`.
```
    func didReceiveError(_ error: String){
        print(error)
    }
```



## 使い方
SampleViewController見たらだいたいわかると思うけど。

### 準備

適当なViewControllerにJCURLSessionDelegateを継承しよう（継承って言い方であってる？）。
```
class SampleViewController: UIViewController, JCURLSessionDelegate {
```

そしたらViewControllerにJCURLSessionDelegateのデリゲートメソッドを実装しよう。
```
    func didReceiveDataAsString(_ string: String) {
        print(string)
    }

    func didReceiveError(_ error: String){
        print(error)
    }

    func didReceiveData(_ data: Data) {
        /*
        if let img = UIImage(data:data){
            imageView.image = img
        }else{
            print("This is not picture")
        }
        */
    }

    func downloadProgress(_ progress: (Int64, Int64)) {
        print("Download progress is \(progress.0)/\(progress.1)")
    }
```

JCURLSessionオブジェクトを初期化しよう。引数にはViewController自身を渡そう。
```
override func viewDidLoad() {
        super.viewDidLoad()
        let jcsession = JCURLSession(delegate: self)

```

### データ

`cURL(_url:)` メソッドにURLを渡そう.
```
jcsession.cURL("https://example.com/index.html")
```

そうすると`didReceiveDataAsString(_ string: String)`デリゲートメソッドが呼ばれて、渡したURLのデータが文字列で拾えるよ。
```
func didReceiveDataAsString(_ string: String) {
    print(string)
}
```


### ダウンロード

`wget(_url:)` メソッドにURLを渡そう。
```
jcsession.wget("https://example.com/example.jpg")
```

そうすると `didReceiveData(_ data: Data)`デリゲートメソッドが呼ばれて、渡したURLのデータがData型で拾えるよ。画像なら適当にUIImageにしよう。
```
func didReceiveData(_ data: Data) {
    if let img = UIImage(data:data){
        imageView.image = img
    }else{
        print("This is not picture")
    }
}
```

ダウンロードの進捗も`downloadProgress(_ progress: (Int64, Int64))`デリゲートメソッドで拾えるよ。割り算すればProgressViewで使えるよ。
```
func downloadProgress(_ progress: (Int64, Int64)) {
    print("Download progress is \(progress.0)/\(progress.1)")
}
```

### エッラー

エラーも`didReceiveError(_ error: String)`デリゲートメソッドで拾えると思うけど、そこまでちゃんと作ってないからあてにしたらあかん。
```
func didReceiveError(_ error: String){
    print(error)
}
```
