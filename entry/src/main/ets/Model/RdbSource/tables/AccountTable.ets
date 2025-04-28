import relationalStore from '@ohos.data.relationalStore';
import { rdb } from '../../../common/string/String';
import { Util_log } from '../../../util/Log/Log';
import Rdb from '../Rdb'
import { AccountData } from './AccountData';

export default class  AccountTable{
  private accountTable = new Rdb(rdb.ACCOUNT_TABLE.tableName,rdb.ACCOUNT_TABLE.sqlCreate,
    rdb.ACCOUNT_TABLE.columns)

  constructor(callback: Function = () => {}) {
    this.accountTable.getRdbStore(callback)
  }

  getRdbStore(callback: Function = () => {}){
    this.accountTable.getRdbStore(callback)
  }

  insertData(account: AccountData,callback: Function = () => {}){
    const valueBucket: relationalStore.ValuesBucket  = generateBucket(account)
    this.accountTable.insertData(valueBucket,callback)
  }

  query(amount: number ,callback: Function, isAll: boolean = true){
    let predicates = new relationalStore.RdbPredicates(rdb.ACCOUNT_TABLE.tableName)
    if(!isAll){

    }
    this.accountTable.query(predicates,(resultSet: relationalStore.ResultSet) => {
      let count: number = resultSet.rowCount;
      if(count == 0 || typeof count == 'string'){
        Util_log.util_log('Query no results!')
        callback([]);
      }else{
        resultSet.goToFirstRow()
        const result: AccountData[] = [];

        for(let i =0 ;i< count;i++){
          let tmp: AccountData = {id:0 ,sender_type:'',context:'',time:''};
          tmp.id = resultSet.getDouble(resultSet.getColumnIndex('id'))
          tmp.sender_type = resultSet.getString(resultSet.getColumnIndex('sender_type'))
          tmp.context = resultSet.getString(resultSet.getColumnIndex('context'))
          tmp.time = resultSet.getString(resultSet.getColumnIndex('time'))
          result.push(tmp)
          //Util_log.util_log(tmp.context+ '')
          resultSet.goToNextRow()
        }
        callback(result)
      }
    })
  }

}

function generateBucket(account: AccountData):relationalStore.ValuesBucket{
  let obj: relationalStore.ValuesBucket = {};
  obj.sender_type = account.sender_type;
  obj.context = account.context;
  obj.time = account.time;
  return obj;
}