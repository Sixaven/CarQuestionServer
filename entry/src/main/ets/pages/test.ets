import { common } from '@kit.AbilityKit'

@Entry
@Component
struct test {
  private context = getContext() as common.UIAbilityContext
  @State arr: number[] = [1,2,3,4,5,6,7,8]
  build() {
    Column(){

    }
    .width(300)
  }
}