import { preferences } from '@kit.ArkData'
import { Context } from '@ohos.abilityAccessCtrl';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Util_log } from '../Log/Log';
import { BusinessError } from '@kit.BasicServicesKit';

let options: preferences.Options = { name: 'myStore' };
class PreUtil {

  private pref: preferences.Preferences | null =  preferences.getPreferencesSync(getContext(),options)


  delPreferences = (context:Context,dataName: string) => {
    preferences.deletePreferences(context,dataName)
      .then(() => {
        Util_log.util_log('preferences删除成功')
      })
      .catch((err: BusinessError) => {
        Util_log.util_log('preferences删除失败')
        Util_log.util_log('err:'+JSON.stringify(err))
      })
  }
  async getPreferences(key: string,defaultValue: preferences.ValueType): Promise<preferences.ValueType>{
    let value = defaultValue;
    if(!this.pref){
      Util_log.util_log('preferences[mydata]未初始化！')
      return value;
    }
    return await this.pref.get(key,defaultValue);
  }

  async putPreferences(key: string, value: preferences.ValueType):Promise<void>{
    if(!this.pref){
      Util_log.util_log('preferences[mydata]未初始化！')
      return;
    }
    try {
      await this.pref.put(key,value);
      await this.pref.flush()
      Util_log.util_log('preferences写入成功')
    }catch(err){
      Util_log.util_log('preferences写入失败')
      Util_log.util_log('err:'+JSON.stringify(err))
    }
  }
}

const preUtil = new PreUtil()

export default preUtil as PreUtil