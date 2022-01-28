Menu.seed(
  {
    id: 35,
    name: '彩りチンジャオロースセット',
    menu_image: 'irodoritinzyao.jpg',
    service_id: 1
  },
  {
    id: 39,
    name: 'プロテインピザ　ツナ＆シュリンプ',
    menu_image: 'pizatuna.jpg',
    service_id: 1
  },
  {
    id: 40,
    name: 'プロテインピザ　スモークチキンと5種のチーズ',
    menu_image: 'pizasmoke.jpg',
    service_id: 1
  }
)
# attributesを使うとメニューと栄養の組み合わせが分かりやすいが、id指定できず。Menu.find(1).nutrients　などで調べられる。［Shift］＋［Command］＋［L］キーで一括コメントアウト外し
# 別ファイルにするとid指定出来るが、そもそもの組み合わせが分かりにくい。しかしデータの重複はない
