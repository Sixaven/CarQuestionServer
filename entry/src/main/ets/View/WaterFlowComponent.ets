import UserItem from '../Model/WaterFlowSouces/WaterFlowData'
import {WaterFlowViewModel} from '../ViewModel/WaterFlowViewModel'
import {waterFlowData} from '../ViewModel/DataViewModel'
import FlowItemComponent from '../View/FlowItemComponent'
@Component
export default struct WaterFlowComponent {
  private dataSource: WaterFlowViewModel = new WaterFlowViewModel()
  private dataHeight: number[] = []
  setHeight(){
    for(let i =0 ;i<this.dataSource.totalCount();i++){

      this.dataHeight.push()
    }
  }
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
    .columnsTemplate('1fr 1fr')
    .columnsGap(10)
    .rowsGap(8)
    .layoutDirection(FlexDirection.Column)
    .layoutWeight(1)
    .padding({left:20})
    .height(400)
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