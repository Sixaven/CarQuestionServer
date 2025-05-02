import { common } from '@kit.AbilityKit'

@Entry
@Component
struct test {
  private context = getContext() as common.UIAbilityContext
  @State arr: number[] = [1,2,3,4,5,6,7,8]
  build() {
    Column(){
      Row(){

      }.backgroundColor(Color.Pink)
      .width('100%')
      .height(100)
      List(){
        ForEach(this.arr,(item:number) => {
          ListItem(){
            Text(item.toString())
              .backgroundColor(Color.Brown)
              .fontSize(20)
          }
        })
      }
      .layoutWeight(1)

      Row(){

      }
      .backgroundColor(Color.Blue)
      .height(100)
      .width('100%')
    }
    .width(300)
  }
}