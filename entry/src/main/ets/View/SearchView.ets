
@Component
 export default struct SearchView {
  build() {
    Row() {
      Image($r('app.media.menu2'))
        .width(35)
        .fillColor(Color.Gray)
      Search({placeholder:'搜你想搜'})
        .layoutWeight(1)
        .margin({left:10,right:10})
    }
    .width('100%')
    .padding(10)
    .margin({top:30,bottom:10})
    .height(50)
    .backgroundColor('#fff')
  }
}