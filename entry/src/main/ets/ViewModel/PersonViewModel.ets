import PersonItemData from '../Model//PersonSources/PersonSoures'
export class PersonViewModel {
  getGridData():Array<PersonItemData>{
    let gridData: Array<PersonItemData> = [
      new PersonItemData('推送通知',$r('app.media.news'),'开关'),
      new PersonItemData('数据管理',$r('app.media.data')),
      new PersonItemData('菜单设置',$r('app.media.menu')),
      new PersonItemData('关于',$r('app.media.about')),
      new PersonItemData('清除缓存',$r('app.media.storage')),
      new PersonItemData('隐私协议',$r('app.media.privacy'))
    ]
    return gridData;
  }
}

export default new PersonViewModel()