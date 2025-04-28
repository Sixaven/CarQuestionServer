import { staticMap } from '@kit.MapKit';
import {AccountTable} from '../../Model/RdbSource/tables/AccountData'
import relationalStore from '@ohos.data.relationalStore';
export class launcher_string{
  static Dialog_launcher_title ="欢迎使用智行知APP";
  static Dialog_launcher_title_content ="我们充分尊重用户的隐私权，并按照法律要求和业界成熟的安全标准，为您的个人信息提供相应的安全保护措施。";
  static Dialog_launcher_privacy ="隐私安全保护声明";
  static Dialog_launcher_privacy_content ="（以下简称\"本声明\"）以便您了解我们如何搜集、使用、披露、保护、存储以及传输您的个人数据。请你仔细阅读本声明。如您有任何疑问，请告诉我们。";
  static Button_yes = "同意";
  static Button_no = "不同意";
}
export class rdb{
  static readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S3
  }

  static readonly ACCOUNT_TABLE: AccountTable = {
    tableName: 'accountTable',
    sqlCreate:'CREATE TABLE IF NOT EXISTS accountTable'+
      '(id INTEGER PRIMARY KEY AUTOINCREMENT,'+
      'sender_type TEXT,'+
      'context TEXT,'+
      'time TEXT)',
    columns: ['id','sender_type','context','time']
  }
}
