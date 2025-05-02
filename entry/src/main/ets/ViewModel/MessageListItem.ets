import { AccountData } from '../Model/RdbSource/tables/AccountData';
@Component
export default struct MessageListItem {
  @Prop message: AccountData
  @Prop length: number
  build() {
    Column() {
      if(this.length > 0){
        haveMessage(this.message.sender_type,this.message.context)
      }else{
        noMessage()
      }
    }
    .width('100%')
  }
}

@Builder function noMessage(){
    Column({space:8}){
      Image($r('app.media.app_icon'))
        .width(50)
      Text('嗨！我是智行知')
        .fontWeight(FontWeight.Bold)
      Text('我可以帮你解答有关鸿蒙汽车的所有疑惑，快来向我提问吧~')
        .opacity(0.6)
        .width('80%')
    }
    .width('100%')
    .margin({top:200})
}

@Builder function haveMessage(type: string,message: string){
  if(type == 'user'){
    Row(){
      Text(message)
        .width('80%')
        .fontSize(20)
        .backgroundColor('#ff10adea')
        .padding(10)
        .borderRadius(20)
      // .lineHeight(10)
    }
    .width('100%')
    .justifyContent(FlexAlign.End)
    .padding({right:20})
  }else{


  }
}