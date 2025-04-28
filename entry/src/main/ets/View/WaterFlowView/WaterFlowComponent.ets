import UserItem from '../../Model/WaterFlowSouces/WaterFlowData'
import {WaterFlowViewModel} from '../../ViewModel/WaterFlowViewModel'
import {waterFlowData} from '../../ViewModel/DataViewModel'
import FlowItemComponent from './FlowItemComponent'
@Component
export default struct WaterFlowComponent {
  private dataSource: WaterFlowViewModel = new WaterFlowViewModel()

  aboutToAppear(): void {
    this.dataSource.setDataArray(waterFlowData);
  }
  build() {
    WaterFlow({footer: ():void => this.itemFooter()}){
      LazyForEach(this.dataSource,(item: UserItem) => {
        FlowItem(){
          FlowItemComponent({item: item})
        }
      },(item: UserItem) => JSON.stringify(item))
    }
    .layoutDirection(FlexDirection.Column)
    .columnsTemplate('1fr 1fr')
    .columnsGap(8)
    .rowsGap(8)
    .layoutWeight(1)
    //.height('58%')
  }

  @Builder
  itemFooter(){
    Column(){
      Text('前面的世界以后再来探索吧')
        .fontSize(10)
        .fontColor(Color.Gray)
        .width('100%')
        .height(20)
        .textAlign(TextAlign.Center)
    }
  }
}