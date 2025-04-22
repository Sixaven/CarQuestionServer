import SearchView from '../View/SearchView'
import SwiperView from '../View/SwiperView'
import WaterFlowComponent from '../View/WaterFlowComponent'


@Component
export default struct Find {
  build() {
    Stack({alignContent: Alignment.Top}){
      Column(){
        SearchView()
        SwiperView()
        WaterFlowComponent()
          .backgroundColor('#ffeeebeb')
      }
      .height('100%')
      //f.padding({left:12,right:12})
    }
  }
}