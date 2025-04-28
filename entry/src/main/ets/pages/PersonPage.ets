import { it } from '@ohos/hypium'
import { NotificationItem_text } from '../Model/NotificationSource/NotificationItem'
import { NotificationSource } from '../Model/NotificationSource/NotificationSource'
import PersonItemData from '../Model/PersonSources/PersonSoures'
import { Util_log } from '../util/Log/Log'
import PersonViewModel from '../ViewModel/PersonViewModel'
@Preview
@Component
export default struct person {
  @State userName: string = '李妙妙'
  @State userEmail: string = '2985855672@qq.com'
  @State buttonState: string = '退出登录'
  @State toggleState: boolean = false
  @Builder personCell(item: PersonItemData){
    Row(){
      Row({space:3}){
        Image(item.image)
          .width(22)
          .height(22)
        Text(item.title)
          .fontSize(16)
      }


      if(item.other === undefined){
        Image($r('app.media.right_grey'))
          .width(12)
          .height(24)
      }else{
        Toggle({type: ToggleType.Switch,isOn: this.toggleState})
          .onChange(() => {
            this.toggleState = !this.toggleState;
            if(this.toggleState){
              NotificationSource.checkEnable()
              let a: NotificationItem_text = {
                id: 1,
                title : '我是标题',
                text: '我是正文',
                additionalText: '我是附加内容'
              }
              NotificationSource.publishText(a)
            }
          })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({right:10})


  }
  build() {
    Column() {
      Row(){
        Image($r('app.media.account'))
          .width(48)
          .height(48)
          .margin({left:10})
        Column({space:3}){
          Text(this.userName)
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
          Text(this.userEmail)
            .fontSize(12)
        }
        .margin({left:24})
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .height(96)
      .backgroundColor('#fff')
      .borderRadius(16)
      .padding({left:24})
      .margin({top:24})


      List(){
        ForEach(PersonViewModel.getGridData(),(item: PersonItemData) => {
          ListItem(){
            this.personCell(item)
          }
          .height(48)
          .backgroundColor('#fff')
          .padding({left:20})
        },(item: PersonItemData) => JSON.stringify(item))
      }
      .margin({top:20})
      .backgroundColor('#fff')
      .borderRadius(16)
      .divider({
        strokeWidth:0.25,
        color:'#666',
        startMargin:42,
        endMargin:24
      })

      Blank()

      Column(){
        Button(this.buttonState,{type: ButtonType.Capsule})
          .fontSize(16)
          .fontColor('#fa2a2d')
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#e5e8ea')
          .width('90%')
          .height(40)
          .margin({bottom:55})
      }
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#fff5f5f5')
  }
}