import UserItem from '../../Model/WaterFlowSouces/WaterFlowData';
import { waterFlowData } from '../../ViewModel/DataViewModel';

@Component
export default struct FlowItemComponent {
  item: UserItem = waterFlowData[0]
  build() {
    Column({space:5}) {
      Column({space:5}){
        Image(this.item.image)
          .width(132)
          .objectFit(ImageFit.Contain)
          .borderRadius({
            topLeft:10,
            topRight:10
          })
          //.margin({top:12,bottom:8})
        Text(this.item.text)
          .fontSize(12)
          .fontWeight(FontWeight.Normal)
          .lineHeight(0)
          .maxLines(3)
          .textOverflow({overflow:TextOverflow.Ellipsis})
      }
      Row(){
        Image(this.item.image_head)
          .width(15)
          .height(15)
          .borderRadius(100)
        Row({space:5}){
          if(this.item.like_state){
            Image($r('app.media.like_true'))
              .width(10)
          }else{
            Image($r("app.media.like_false"))
              .width(10)
          }
          Text(this.item.like_num.toString())
            .fontSize(8)
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding({
      left:12,
      right:12,
      bottom:12
    })
    .backgroundColor('#fff')
    .borderRadius(10)
  }
}