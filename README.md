## :relieved: はじめに  
ECサイト構築の現場でよくある困りごとをテーマに、学習したプログラミング技能を活かした課題解決ができないか検討してみました！！  

## 😅困りごとテーマ一覧  
No.1：商品情報の一括更新が面倒  
No.2：配送日時の指定を追加したい  
No.3：在庫切れ商品の非表示  
No.4：レポート機能が物足りない  

## 💪動作確認と結果  
◆　No.１：商品情報の一括更新が面倒  
▼　困りごと  
  - 商品数が多い場合、Shopify管理画面から一つずつ更新するのは手間。  
  - CSVインポート/エクスポートは便利だが、カスタマイズ性が低い。  

▼　試したこと  
Shopify Admin APIを用い商品データを取得  

▼ 結果  
No.1：商品情報の一括取得  

![image](https://github.com/user-attachments/assets/60eac71e-6ae6-4fac-ac3d-c6dafc420550)

◆　No.2：配送日時の指定を追加したい  
▼　困りごと 
Shopifyの標準機能では、顧客が購入時に配送日時を指定できない。  

▼　試したこと  
Liquidの内の下記のパスで配送日を選択するコードを追加    
path：　sections / </>cart-notification-product.liquid  

![image](https://github.com/user-attachments/assets/8517556c-1840-4319-bee4-ec40a886dca6)


▼　結果
配送日を選択する項目を追加
![image](https://github.com/user-attachments/assets/d5797e7e-8a59-4900-94e6-3db0727ccac0)



## おわりに
