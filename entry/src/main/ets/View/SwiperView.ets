import {SwiperImage} from '../ViewModel/DataViewModel'
@Component
export default struct SwiperView {
  dotIndicator: DotIndicator = new DotIndicator()
  build() {
   Swiper(){
     ForEach(SwiperImage,(item:Resource) => {
       Image(item)
         .width('100%')
         .height(150)
         .borderRadius(16)
         .backgroundColor('#fff')
     },(item: Resource) => JSON.stringify(item))
   }
    .indicator(this.dotIndicator)
    .autoPlay(true)
    .itemSpace(0)
    .displayCount(1)
    .margin({
      top:12,
      bottom:12
    })
  }
}