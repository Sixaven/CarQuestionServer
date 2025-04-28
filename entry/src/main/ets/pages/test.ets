import { common } from '@kit.AbilityKit'

@Entry
@Component
struct test {
  private context = getContext() as common.UIAbilityContext
  build() {
    Column(){
      Button('点击')
        .margin(30)
        .onClick(() => {
          this.context.eventHub.emit('event1','李妙妙是大美女')
        })
    }
    .width(300)
  }
}