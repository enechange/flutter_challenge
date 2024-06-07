# 準備
APIキーをapi_keysという別ファイル管理にする運用にしています
api_keysの中身は以下です
```text
SERVER_API_KEY=''
GOOGLE_MAP_API_KEY=''
```

以下のコマンドを実行しapi周りの準備をしてください
`from`はapi_keysのファイルパス
```bash
cp from scripts/api_keys
cd scripts
bash prepare_api_keys.sh
```

# Flutter Coding Challenge

## Instructions

### Steps
以下2つの方法から選んで進めてください。
* Forkする
  * 弊社のリポジトリにPRとして履歴が残ります
* Templateとして使用する
  * 弊社側にPRとしては履歴が残りません

#### Fork
1. このリポジトリをForkしてください。
2. 新しくブランチを切ってください。
(ブランチ名は `challenge1/YOURNAME(本名orGithub Account name)` (eg. `challenge1/shirakia`))
3. flutter_map_appプロジェクトで実装を進めてください(flutter_map_appディレクトリをエディタで開くと進めやすいです)。
4. 終了後、PullRequestを作成し、PullRequestのURLをご連絡ください。
5. PullRequestのURLをお伝えいただいた後でもcommitしていただいて構いません。

#### Template
1. Githubから 「Use this template」を選択し、リポジトリ(privateでも可)を作成してください。
2. 新しくブランチを切ってください。
(ブランチ名は `challenge1/YOURNAME(本名orGithub Account name)` (eg. `challenge1/shirakia`))
3. flutter_map_appプロジェクトで実装を進めてください(flutter_map_appディレクトリをエディタで開くと進めやすいです)。
4. 終了後、PullRequestを作成し、リポジトリのURLをご連絡ください(privateの場合、指定したユーザーを招待してください)。
5. リポジトリのURLをお伝えいただいた後でもcommitしていただいて構いません。

### PullRequestの作り方
PullRequestを作る際に、PRテンプレートが反映されます。
テンプレートに沿って、PRコメントとして必要事項を記述してください。

## Challenge
Flutterで充電スポットマップ画面を作成してください。

以下、画面の仕様や使用するAPIの情報です。これらの仕様についてチャレンジ期間の中で可能な範囲で実装してください。

仕様や実装について不明な点があれば適宜ご相談ください。

また、このChallengeはプログラムの完成度を求めるものではなく、挑戦いただく方のスキルレベルをベースに、以下の項目などを総合的に見させて頂く場として作成しております。
- コードの品質
- 実装に関する説明
- 質疑応答

### 画面仕様
- マップ上の充電スポットのある場所にマーカーを表示してください
- マーカーにはそのスポットの充電器の数を表示します
- 画面下部には各充電スポットの名称や写真、営業時間などが記載されたカードをカルーセル表示してください
- 画面デザインやその他の細かい仕様については [Figma](https://www.figma.com/file/q4i9uo1n4poIbO7iGPbqQH/?node-id=1414-77) をご覧ください（Figmaのアカウントを作成すると細かいところまで閲覧できるようになります）。
- **Figma内で(Option)と記載させていただいた仕様については、余力があったらトライしてください**
- 課題の優先度は、高い順に以下の順番になります。確保できる時間に応じて実施する量を適宜調整してください。
1. [マップ/初期表示](https://www.figma.com/file/q4i9uo1n4poIbO7iGPbqQH/ENECHANGE-%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%83%81%E3%83%A3%E3%83%AC%E3%83%B3%E3%82%B8?type=design&node-id=1414-78&mode=design&t=HALw18VIzoL2un47-4)
1. [マップ/スポットにフォーカス](https://www.figma.com/file/q4i9uo1n4poIbO7iGPbqQH/ENECHANGE-%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%83%81%E3%83%A3%E3%83%AC%E3%83%B3%E3%82%B8?type=design&node-id=1417-511&mode=design&t=HALw18VIzoL2un47-4)
1. [マップ/エリアを移動](https://www.figma.com/file/q4i9uo1n4poIbO7iGPbqQH/ENECHANGE-%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%83%81%E3%83%A3%E3%83%AC%E3%83%B3%E3%82%B8?type=design&node-id=1414-319&mode=design&t=HALw18VIzoL2un47-4)

### 使用パッケージについて
実装の際に、以下パッケージは必ず使用してください(これらはすでにpubspec.yamlに記述してあります)。
バージョンの指定はございません。
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter)
  - 使用にはGoogleMapのAPIキーが必要です。[GoogleMapの設定方法](#GoogleMapの設定方法)を参考にキー取得、設定をしてください。
  - **セキュリティの観点からキーはコミットしないようご注意ください**
- [geolocator](https://pub.dev/packages/geolocator)

### 充電スポット一覧API

#### Repositoryクラス
- API実行については [charger_spots_repository.dart](lib/repository/charger_spots_repository.dart) を用意していますので、適宜ご活用ください

#### API Keyの取得、設定
- APIに必要な認証トークン `X-EVENE-NATIVE-API-TOKEN` は別途お伝えいたします
  - **ただし、セキュリティの観点からキーはコミットしないようお願いします。**
- API KeyはRepositoryクラス内部の `apiKey` に仮定義していますので、適宜書き換えてください

#### API詳細
- 詳細は[API仕様書](https://stg.evene.jp/apidocs/charger_spots#/charger_spots)をご確認ください
- モデルクラスなどの詳細を確認したい場合は　[guide_api_sdk](docs/guide_api_sdk.md) を参照ください

#### 課題内部でのAPI使用方法
- リクエスト: 本課題では緯度経度パラメータ（`sw_lat`,`sw_lng`,`ne_lat`,`ne_lng`）のみを使用します
- レスポンス: 本課題でメインで使用するものを紹介します
  - `images`: スポットのサムネイル表示に使用します
  - `charger_devices`: カード情報やマーカーのスポット数の計算のために使用します
  - `charger_spot_service_times`: カード内の「営業中/営業時間外」項目で使用します
  - (`gogoev` と記載のあるパラメーターがいくつかありますが、本課題では使用しません)

### GoogleMapの設定方法

#### API Keyの取得
[公式ドキュメント](https://pub.dev/packages/google_maps_flutter) を参考にAPI Keyを取得してください。

#### Android
`android/app/src/main/AndroidManifest.xml` 34行目の
`YOUR KEY HERE` の部分を上で取得したAPI Keyに置き換えてください。

#### iOS
`ios/Runner/AppDelegate.swift` 11行目の
`YOUR KEY HERE` の部分を上で取得したAPI Keyに置き換えてください。

#### 注意
自身で取得したAPI Keyは<b>絶対に</b>コミットしないでください。
