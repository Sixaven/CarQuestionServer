import {IUserItem} from '../Model/WaterFlowSouces/WaterFlowData'

const waterFlowData: IUserItem[] = [
  {
    image: $r('app.media.p8'),
    text: '华为与赛力斯联合打造的AITO问界系列凭借HarmonyOS智能座舱和DriveONE电驱技术，成为2023年新能源市场的一匹黑马。',
    image_head:$r('app.media.app_icon'),
    like_state: false,
    like_num:12
  },
  {
    image: $r('app.media.p2'),
    text: '华为ADS 2.0高阶智能驾驶系统已实现无图化城市NCA功能。',
    image_head:$r('app.media.app_icon'),
    like_state: false,
    like_num:12
  },
  {
    image: $r('app.media.p3'),
    text: '余承东曾表示"华为不造车，但帮助车企造好车"，HI（Huawei Inside）模式正赋能北汽、长安等合作伙伴。',
    image_head:$r('app.media.app_icon'),
    like_state: false,
    like_num:12
  },
  {
    image: $r('app.media.p4'),
    text: '问界M7上市首月大定突破6万台',
    image_head:$r('app.media.app_icon'),
    like_state: false,
    like_num:12
  },
  {
    image: $r('app.media.p5'),
    text: '华为数字能源提供的超充技术可实现',
    image_head:$r('app.media.app_icon'),
    like_state: false,
    like_num:12
  },
  {
    image: $r('app.media.p6'),
    text: '鸿蒙车机系统支持多设备无缝流转，手机应用可一键投射至车载大屏，重新定义人车交互体验。',
    image_head:$r('app.media.app_icon'),
    like_state: false,
    like_num:12
  },
  {
    image: $r('app.media.p7'),
    text: '2024年华为智能汽车解决方案BU预计实现盈亏平衡，智能车灯、AR-HUD等创新部件获多家国际车企订单。',
    image_head:$r('app.media.app_icon'),
    like_state: false,
    like_num:12
  },
]

const SwiperImage: Resource[] =[
  $r('app.media.p1'),
  $r('app.media.p2'),
  $r('app.media.p3'),
]

export {waterFlowData,SwiperImage}