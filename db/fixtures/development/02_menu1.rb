Menu.seed(
  {
    id: 31,
    name: 'プロテインピザ　ツナ＆シュリンプ',
    menu_image: 'pizatuna.jpg',
    service_id: 1,
    nutrients_attributes: [
      { #id: 1,
        calorie: 400,
        protein: 32.8,
        fat: 14.1,
        carb: 41.8,
        size: 'LEAN'
      }
    ]
  },
  {
    id: 32,
    name: 'プロテインピザ　スモークチキンと5種のチーズ',
    menu_image: 'pizasmoke.jpg',
    service_id: 1,
    nutrients_attributes: [
      { #id: 2,
        calorie: 408,
        protein: 30.8,
        fat: 14.8,
        carb: 42.7,
        size: 'LEAN'
      }
    ]
  }
)
#attributesを使うとメニューと栄養の組み合わせが分かりやすいが、id指定できず。Menu.find(1).nutrients　などで調べられる。［Shift］＋［Command］＋［L］キーで一括コメントアウト外し
#別ファイルにするとid指定出来るが、そもそもの組み合わせが分かりにくい。しかしデータの重複はない
