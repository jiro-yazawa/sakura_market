# さくらマーケット
## ■ URL 設計
### ユーザー
- トップページ(商品一覧): GET: `/`
- ユーザーの新規登録画面を表示: GET: `/sign_up`
- ユーザーのログイン画面を表示: GET: `/login`
- ユーザーがログイン: POST: `/login`
- ユーザーがログアウト: POST: `/logout`
- ユーザーの詳細を表示: GET: `/user`
- ユーザーの編集画面を表示: GET: `/user/edit`
- ユーザーを新規登録: POST: `/user`
- ユーザーを編集: PATCH: `/user`
- ユーザーの配送先の編集画面を表示: GET: `/user/address/edit`
- ユーザーの配送先を編集: PATCH: `/user/address`
- ユーザーのログイン情報の編集画面を表示: GET: `/user/login/edit`
- ユーザーのログイン情報を編集: PATCH: `/user/login`
- 商品の一覧を表示: GET: `/products`
- 商品の詳細を表示: GET: `/products/:id`
- ショッピングカートを表示: GET: `/cart`
- ショッピングカートに商品を追加: POST: `/cart/add_item`
- ショッピングカートの商品を編集: POST: `/cart/update_item`
- ショッピングカートの商品を削除: POST: `/cart/delete_item`
- 注文画面を表示: GET: `/orders/new`
- 注文一覧を表示: GET: `/orders`
- 注文詳細を表示: GET: `/orders/:id`
- 注文を新規登録: POST: `/orders`

### 管理者

- 商品の登録画面を表示: GET: `/products/:id/new`
- 商品の編集画面を表示: GET: `/products/:id/edit`
- 商品を登録: POST:`/products/`
- 商品を編集: PATCH:`/products/`
- 商品を削除: DELETE:`/products/`
- 商品を並べ替え: POST: `/products/move`
- ユーザーの一覧画面を表示: GET: `/users`
- ユーザーの詳細画面を表示: GET: `/users/:id`
- ユーザーの編集画面を表示: GET: `/users/:id/edit`
- ユーザーを編集: PATCH: `/users/:id`
- ユーザーを削除: DELETE: `/users/:id`

## 画面一覧
- ルート
- ログイン
- ユーザー登録
- ユーザー詳細
- ユーザー編集
- ユーザー配送先編集
- 商品一覧
- 商品詳細
- 商品登録
