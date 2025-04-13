import { Util_log } from '../../util/Log/Log';
import preUtil from '../../util/DataSoures/Preferences'
import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';
import launcher_Dialog from '../CustomDiag//launcher_Dialog'
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State timeId: number = 0;
  private context?: common.UIAbilityContext;
  private isJumpToAdvertising: boolean = false;

  dialogController: CustomDialogController = new CustomDialogController({
    builder:launcher_Dialog({
      confirm:() => { this.onConfirm() },
      cancel: () => { this.onCancel() },
    }),
    offset:{dx:0,dy:-24},
    alignment:DialogAlignment.Bottom
  })

  onConfirm(){
    this.savePrivacy();
    this.jumpToMain()
  }
  onCancel(){
    try {
      // 终止当前应用
      this.context?.terminateSelf();
    } catch (error) {
      Util_log.util_log('退出应用失败:'+error)

    }
  }

  savePrivacy(){
    preUtil.putPreferences('launcher',true)
      .then(() => {
        Util_log.util_log('写入launcher成功')
      })
      .catch((err:BusinessError) => {
        Util_log.util_log('写入launcher失败')
        Util_log.util_log('err:' + JSON.stringify(err))
      })
  }

  onPageShow(): void {
  preUtil.getPreferences('launcher',false)
    .then((value) => {
      if(value === true){
        //跳转主页
        this.jumpToMain()
      }else {
        //弹出弹窗'
        this.dialogController.open()
      }
    })
    .catch((err: BusinessError) => {
       Util_log.util_log('获得launcher失败')ssh-keygen -t rsa -C
       Util_log.util_log('err:' + JSON.stringify(err))
    })

  }
  jumpToMain(){
    this.timeId = setTimeout(()=> {
      this.isJumpToAdvertising = true;
      router.pushUrl({
        url:"View/pages/main"
      }).catch((err: BusinessError) => {
        Util_log.util_log('跳转main失败'+'err:'+JSON.stringify(err))
      })
    },3000)
  }



  onPageHide(): void {
    if(this.isJumpToAdvertising){
      router.clear();
    }

    clearTimeout(this.timeId);
  }
  build() {
     Stack(){
       Image($r('app.media.launcher'))
         .height('100%')
         .width('100%')
         .objectFit(ImageFit.Fill)
     }
     .height('100%')
     .width('100%')
  }
}