import {notificationManager} from '@kit.NotificationKit'
import {BusinessError} from '@kit.BasicServicesKit'
import {NotificationItem_text,NotificationItem_progress} from './NotificationItem'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { Util_log } from '../../util/Log/Log'
import { common } from '@kit.AbilityKit'
import { it } from '@ohos/hypium'

export class NotificationSource{

  static checkEnable(){
    notificationManager.isNotificationEnabled()
      .then((data:boolean) => {
        if(!data){
          let context = getContext() as common.UIAbilityContext
          notificationManager.requestEnableNotification(context)
            .then(() => {
            Util_log.util_log('通知权限申请成功')
          })
            .catch((err:BusinessError) => {
              if(1600004 === err.code){
                Util_log.util_log('用户拒绝授权,通知权限申请失败')
              }else {
                Util_log.util_log('非用户原因通知权限申请失败')
              }

            })
        }
      })
      .catch((err:BusinessError) => {
        Util_log.util_log('其他原因通知权限申请失败')
      })
  }

  static publishText(item:NotificationItem_text){
    let noti: notificationManager.NotificationRequest = {
      id: item.id,
      notificationSlotType:notificationManager.SlotType.SOCIAL_COMMUNICATION,
      content:{
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: item.title,
          text: item.text,
          additionalText: item.additionalText
        }
      }
    }
    //notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION);
    notificationManager.publish(noti,(err: BusinessError) => {
      if(err){
        Util_log.util_log(`通知id：${noti.id}发布失败`)
        return;
      }
      Util_log.util_log(`通知id：${noti.id}发布成功，标题为${noti.content.normal?.title}`)

    })
  }
}