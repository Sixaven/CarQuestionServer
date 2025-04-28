import relationalStore from '@ohos.data.relationalStore';
import { rdb } from '../../common/string/String';
import { Util_log } from '../../util/Log/Log';


export default class Rdb{
  private rdbStore: relationalStore.RdbStore | null = null;
  private tableName: string;
  private sqlCreateTable: string;
  private columns: string[];

  constructor(tableName: string, sqlCreateTable: string, columns: string[]) {
    this.tableName = tableName
    this.sqlCreateTable = sqlCreateTable
    this.columns = columns
  }


  getRdbStore(callback:Function = () => {}){
    if(!callback || typeof callback == 'undefined' || callback == undefined){
      Util_log.util_log('getRdbStore() has no callback!');
      return;
    }
    if(this.rdbStore != null){
      Util_log.util_log('The rdbStore exists');
      callback()
      return;
    }
    let context: Context = getContext(this) as Context
    relationalStore.getRdbStore(context,rdb.STORE_CONFIG,(err,rdb) => {
      if(err){
        Util_log.util_log('gerRdbStore() failed, err: ' + err);
        return;
      }
      this.rdbStore = rdb;
      this.rdbStore.executeSql(this.sqlCreateTable)
      Util_log.util_log('getRdbStore() finished.')
      callback();
    })
  }

  insertData(data: relationalStore.ValuesBucket,callback:Function = () => {}){
    if(!callback || typeof callback == 'undefined' || callback == undefined){
      Util_log.util_log('getRdbStore() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    const valueBucket: relationalStore.ValuesBucket = data
    if(this.rdbStore){
      this.rdbStore.insert(this.tableName,valueBucket,(err,ret) => {
        if(err){
          Util_log.util_log('gerRdbStore() failed, err: ' + err);
          callback(resFlag);
          return;
        }
        Util_log.util_log('insertData() finished: ' + ret)
        callback(ret)
      })
    }
  }

  query(predicates: relationalStore.RdbPredicates, callback: Function = () => {}){
    if(!callback || typeof callback == 'undefined' || callback == undefined){
      Util_log.util_log('getRdbStore() has no callback!');
      return;
    }
    if(this.rdbStore){
      this.rdbStore.query(predicates,this.columns,(err,resultSet) => {
        if(err){
          Util_log.util_log('query() failed, err: ' + err)
          return;
        }
        Util_log.util_log('query() finished.' );
        callback(resultSet)
        resultSet.close()
      })
    }
  }

}