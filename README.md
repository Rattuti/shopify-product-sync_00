## :relieved: はじめに  
ECサイトの構築で「こんな機能があれば、もっと便利だろうに」との、現場でよくある困ったことをテーマにプログラミングで解決できいか試してみました！


## 😅 困りごとテーマ一覧  
|No|困りごと|
|:-:|:-|
|1|商品情報を手作業で一括更新が大変|
|2|希望の配送日時の指定したい|
|3|在庫切れ商品を自動で隠したい|
|4|レポート機能が物足りない|

## 👍️ 解消  
No.1, 3  
商品情報を取得し、在庫切れなら一目でわかるように灰色シートで目立ちにくくした  

https://github.com/user-attachments/assets/f0502f6d-827d-40c5-9402-d6d737e2f8d0


## 💪 動作確認と結果  
◆　No.１：商品情報の一括更新が面倒  
▼　困りごと  
  - 商品数が多い場合、Shopify管理画面から一つずつ更新するのは手間。  
  - CSVインポート/エクスポートは便利だが、カスタマイズが難しい。  

▼　試したこと  
☑　Shopify Admin APIを用い商品データを取得&更新できるようにする。 

▼ 結果  
商品情報の一括取得  
![image](https://github.com/user-attachments/assets/60eac71e-6ae6-4fac-ac3d-c6dafc420550)



### 📦️ No.2：配送日時の指定を追加したい  
▼　困りごと 
Shopifyの標準機能では、顧客が購入時に配送日時を指定できない。  

▼　試したこと    
☑カートページに配送希望日が選択できる項目を追加する  

▼　結果  
Liquidの編集ファイルにパスは下記の通り  
```
Path：　sections / </>cart-notification-product.liquid
```
```liquid
 <!-- ここに配送日時の選択フィールドを追加 -->
<form method="post" action="/cart">
  配送希望日：<input type="date" name="attributes[配送希望日]" required>
  <input type="submit" value="更新">
</form>
```
![image](https://github.com/user-attachments/assets/8517556c-1840-4319-bee4-ec40a886dca6)

🛒カート画面に配送日が選択できるようになった。  
📌ユーザが自由に配送日を選べるため、UXが向上  
![image](https://github.com/user-attachments/assets/02f698b3-39ed-4802-bba1-924244fa420d)

### 📦️ 在庫切れ商品を自動で隠したい
▼　困りごと  
在庫がない商品がストアに表示され続け、ユーザが勘違いしてしまいクレームに繋がりがち。　　  

▼　試したこと    
☑商品が在庫切れの場合に非公開にするようにスクリプトを作成。  

```
Path：　section / </>featured-collection
```
```liquid
{%- for product in section.settings.collection.products limit: section.settings.products_to_show -%}
          {%- if product.available -%}  <!-- 在庫がある場合 -->
            <li
              id="Slide-{{ section.id }}-{{ forloop.index }}"
              class="grid__item
              {% if show_mobile_slider or show_desktop_slider %}
                slider__slide
              {% endif %}
                {% if settings.animations_reveal_on_scroll %}
                  scroll-trigger animate--slide-in
                {% endif %}"
              {% if settings.animations_reveal_on_scroll %}
                data-cascade
                style="--animation-order: {{ forloop.index }};"
              {% endif %}
            >
              {% render 'card-product',
                card_product: product,
                media_aspect_ratio: section.settings.image_ratio,
                image_shape: section.settings.image_shape,
                show_secondary_image: section.settings.show_secondary_image,
                show_vendor: section.settings.show_vendor,
                show_rating: section.settings.show_rating,
                skip_styles: skip_card_product_styles,
                section_id: section.id,
                quick_add: section.settings.quick_add
              %}
            </li>
            {%- assign skip_card_product_styles = true -%}
          {%- else -%}  <!-- 在庫がない場合 -->
            <li
              id="Slide-{{ section.id }}-{{ forloop.index }}"
              class="grid__item"
            >
              <p>在庫切れ</p>  <!-- 在庫切れと表示 -->
            </li>
          {%- endif -%}
```




---
### 🎉 まとめ  
このリポジトリでは、Shopifyストアでよく直面する課題をプログラミングによって解決しました。  
これらのカスタマイズを導入することで、ECサイトの運営が効率化され、ユーザーの体験も向上します。  
今後も新しい機能や改善案を追加していく予定です。

---
### 📬 お問い合わせ  
質問や改善点があれば、GitHub Issuesでご連絡いただけますと幸いです！。  
