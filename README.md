## :relieved: はじめに  
ECサイトの構築で「こんな機能があれば、もっと便利だろうに」との、現場でよくある困ったことをテーマにプログラミングで解決できいか試してみました！

## 😅困りごとテーマ一覧  
|No|困りごと|
|:-:|:-|
|1|商品情報を手作業で一括更新が大変|
|2|希望の配送日時の指定したい|
|3|在庫切れ商品を自動で隠したい|
|4|レポート機能が物足りない|

## 💪動作確認と結果  
◆　No.１：商品情報の一括更新が面倒  
▼　困りごと  
  - 商品数が多い場合、Shopify管理画面から一つずつ更新するのは手間。  
  - CSVインポート/エクスポートは便利だが、カスタマイズが難しい。  

▼　試したこと  
☑　Shopify Admin APIを用い商品データを取得&更新できるようにする。 

▼ 結果  
商品情報の一括取得  
![image](https://github.com/user-attachments/assets/60eac71e-6ae6-4fac-ac3d-c6dafc420550)

一括更新
　※　調整中


### 📦️No.2：配送日時の指定を追加したい  
▼　困りごと 
Shopifyの標準機能では、顧客が購入時に配送日時を指定できない。  

▼　試したこと    
☑カートページに配送希望日が選択できる項目を追加する  

▼　結果  
Liquidの編集ファイルにパスは下記の通り  
path：　sections / </>cart-notification-product.liquid  
![image](https://github.com/user-attachments/assets/8517556c-1840-4319-bee4-ec40a886dca6)

🛒カート画面に配送日が選択できるようになった。  
📌ユーザが自由に配送日を選べるため、UXが向上  
![image](https://github.com/user-attachments/assets/02f698b3-39ed-4802-bba1-924244fa420d)




## おわりに
