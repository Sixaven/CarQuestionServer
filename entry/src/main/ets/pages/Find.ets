import SearchView from '../View/SearchView'
import SwiperView from '../View/SwiperView'
import WaterFlowComponent from '../View/WaterFlowView/WaterFlowComponent'
import { UIAbility } from '@kit.AbilityKit'


@Component
export default struct Find {
  private colorMatrix: Array<number> = [
    0.5, 0.3, 0.2, 0, 0,
    0.5, 0.3, 0.2, 0, 0,
    0.5, 0.3, 0.2, 0, 0,
    0,    0,    0,    1, 0      // Alpha通道不变
  ];
  aboutToAppear(): void {
    //let UIAbility = this.getUIContext(this) as UIAbility
  }
  build() {
    Stack({alignContent: Alignment.Top}){
      Image($r('app.media.img'))
        .width('100%')
        .objectFit(ImageFit.Cover)
        .colorFilter(this.colorMatrix)
      Column(){
        SearchView()
        SwiperView()
        WaterFlowComponent()
      }
      .padding({left:12,right:12})

    }
    .backgroundColor('#ffeeebeb')
  }
}