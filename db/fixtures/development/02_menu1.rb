Menu.seed(
  {
    id: 31,
    name: 'プロテインピザ　ツナ＆シュリンプ',
    menu_image: 'pizatuna.jpg',
    service_id: 1
  },
  {
    id: 32,
    name: 'プロテインピザ　スモークチキンと5種のチーズ',
    menu_image: 'pizasmoke.jpg',
    service_id: 1
  }
)
# attributesを使うとメニューと栄養の組み合わせが分かりやすいが、id指定できず。Menu.find(1).nutrients　などで調べられる。［Shift］＋［Command］＋［L］キーで一括コメントアウト外し
# 別ファイルにするとid指定出来るが、そもそもの組み合わせが分かりにくい。しかしデータの重複はない
