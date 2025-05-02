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
    Column() {
      Row(){
        Text('新对话')
          .height(33)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .margin({top:30})
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      List({space:12}){
        if(this.account.length == 0){
          ListItem(){
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
        }else {
          ForEach(this.account,(item: AccountData) => {
            ListItem(){
              MessageListItem({message:item})
            }
          },(item: AccountData) => JSON.stringify(item))
        }
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
    .padding(10)
    .width('100%')
    .height('100%')
  }
}