import {launcher_string} from '../common/string/String'
import { preferences } from '@kit.ArkData'

let dataPreferences: preferences.Preferences | null = null;
@Preview
@CustomDialog
export default struct launcher_Dialog {
  controller: CustomDialogController = new CustomDialogController({'builder':''})
  //不同意按钮
  cancel: Function = () => {}
  //同意按钮
  confirm: Function = () => {}


  build() {
    Column({space:4}) {
      //弹窗标题
      Text(launcher_string.Dialog_launcher_title)
        .fontSize(16)
        .fontColor('#000')
        .textAlign(TextAlign.Center)

      //弹窗内容
      Text(launcher_string.Dialog_launcher_title_content)
        .fontSize(15)
        .fontColor('#000')
      //隐私链接
      Text(launcher_string.Dialog_launcher_privacy)
        .fontSize(15)
        .fontColor('#f34194ff')
      //隐私内容
      Text(launcher_string.Dialog_launcher_privacy_content)
        .fontSize(15)
        .opacity(0.5)
      //
      Row(){
        Button(launcher_string.Button_no).width(80)
          .onClick(() => {
            this.cancel()
          })
        Button(launcher_string.Button_yes).width(80)
          .onClick(() => {
            this.confirm()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(20)
  }
}

