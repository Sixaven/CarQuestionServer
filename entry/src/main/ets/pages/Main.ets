import person from './PersonPage';
import SearchView from '../View/SearchView'
import WaterFlowComponent from '../View/WaterFlowView/WaterFlowComponent'
import SwiperView from '../View/SwiperView';
import Find from './Find';
import Home from './Home';

@Entry
@Component
struct main {
  @State currentIndex: number = 0;
  @Builder tabBuilder(title: string,index:number,image_y:Resource,image_n?:Resource){
    Column({space:3}){
      Image(image_y)
        .size({width:25,height:25})
        .fillColor(this.currentIndex === index? '#1698CE':'#6B6B6B');
      Text(title)
        .fontSize(12)
        .fontColor(this.currentIndex === index? '#1698CE':'#6B6B6B')
    }
    .border({
      width:{top:1},
      color:'#ffeeebeb'
    })

    .width('100%')
    .justifyContent(FlexAlign.Center)

  }
  build() {
    Column(){
      Tabs({
        barPosition:BarPosition.End,
        index:0
      }){
        TabContent(){
          Home()
        }
        .tabBar(this.tabBuilder('首页',0,$r('app.media.sy')))

        TabContent(){
          Find()
        }
        .tabBar(this.tabBuilder('发现',1,$r('app.media.fx')))

        TabContent(){
          person()
        }
        .tabBar(this.tabBuilder('个人',2,$r('app.media.gr')))

      }
      .width('100%')
      .height('100%')
      .scrollable(false)
      .onChange((index:number) => {
        this.currentIndex = index;
      })
    }
    .padding({bottom:15})
    .width('100%')
    .height('100%')
  }
}


