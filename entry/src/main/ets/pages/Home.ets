import { AccountData } from '../Model/RdbSource/tables/AccountData'
import AccountTable from '../Model/RdbSource/tables/AccountTable'
import json from '@ohos.util.json';
import prompt from '@ohos.promptAction';
import MessageListItem from '../ViewModel/MessageListItem';
import { Util_log } from '../util/Log/Log';

@Component
export default struct Home {
  @State account: AccountData[] = []
  @State textInput: string = ''
  private AccountTable = new AccountTable();

  aboutToAppear(): void {
    this.AccountTable.getRdbStore(() => {
      this.AccountTable.query(0,(result: AccountData[]) => {
        this.account = result;
      },true)
    })
  }
  build() {
    Stack(){
      Column() {
        Row(){
          Text('新对话')
            .height(33)
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .margin({top:40,bottom:10})
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .expandSafeArea([SafeAreaType.KEYBOARD])
        .backgroundColor('#fff')
        .zIndex(999)

        List({space:12}){
          ForEach(this.account,(item: AccountData) => {
            ListItem(){
              MessageListItem({message:item,length:this.account.length})
            }
          },(item: AccountData) => JSON.stringify(item))
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        //Blank()
        Row(){
          TextInput({placeholder:'给智行知发送消息'})
            .layoutWeight(1)
            .onChange((data) => {
              this.textInput = data
            })
          Image($r('app.media.send'))
            .width(30)
            .onClick(() => {
              if(this.textInput === ''){
                prompt.showToast({
                  message:'不能为空'
                })
                return;
              }
              const data: AccountData = {
                context: this.textInput,
                sender_type: 'user',
                time: new Date().toString()
              }
              this.AccountTable.insertData(data,(id: number) => {
                data.id = id
                this.account.push(data);
              })
            })
        }
        .width('100%')
        .height(50)
      }
      .padding({left:10,right:10})
      .width('100%')
      .height('100%')
    }

    //.backgroundImageSize(ImageSize.Cover)
  }
}