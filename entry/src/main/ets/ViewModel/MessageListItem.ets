import { AccountData } from '../Model/RdbSource/tables/AccountData';

@Component
export default struct MessageListItem {
  @Prop message: AccountData
  build() {
    Column() {
      if(this.message.sender_type == 'user'){
        Row(){
          Text(this.message.context)
            .width('50%')
            .fontSize(20)
            .backgroundColor('#ff10adea')
           // .lineHeight(10)
        }
        .width('100%')
        .justifyContent(FlexAlign.End)
        .padding({right:20})
        .borderRadius(20)

      }
    }
    .width('100%')
    .height('100%')
  }
}