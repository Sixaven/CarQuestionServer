import { hilog } from '@kit.PerformanceAnalysisKit'

export class Util_log{
  static  util_log(content:string){
    hilog.info(0x0000,'testTag',content)
  }
}