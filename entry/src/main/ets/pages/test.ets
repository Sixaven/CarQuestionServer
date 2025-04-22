@Entry
@Component
struct test {
  build() {

    WaterFlow(){
      FlowItem(){
        Text().width(100).height(100)
          .backgroundColor(Color.Pink)
      }
      FlowItem(){
        Text().width(100).height(100)
          .backgroundColor(Color.Pink)
      }
      FlowItem(){
        Text().width(100).height(100)
          .backgroundColor(Color.Pink)
      }
      FlowItem(){
        Text().width(100).height(100)
          .backgroundColor(Color.Pink)
      }
      FlowItem(){
        Text().width(100).height(100)
          .backgroundColor(Color.Pink)
      }
      FlowItem(){
        Text().width(100).height(100)
          .backgroundColor(Color.Pink)
      }
      FlowItem(){
        Text().width(100).height(100)
          .backgroundColor(Color.Pink)
      }
      FlowItem(){
        Text().width(100).height(100)
          .backgroundColor(Color.Pink)
      }
      FlowItem(){
        Text().width(100).height(100)
          .backgroundColor(Color.Pink)
      }


    }
    .width('100%')
    .columnsTemplate('1fr 1fr')
    .columnsGap(6)
    .rowsGap(6)
    .padding({
      left: 42,
      right: 12,
      bottom:12
    })
  }
}