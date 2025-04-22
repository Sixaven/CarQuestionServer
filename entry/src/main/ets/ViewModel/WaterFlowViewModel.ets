import UserItem from '../Model/WaterFlowSouces/WaterFlowData'


export class WaterFlowViewModel implements IDataSource{
  private dataArray: UserItem[] = [];
  private listeners: DataChangeListener[] = [];


  public setDataArray(userDataArray: UserItem[]){
    this.dataArray = userDataArray;
  }

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): UserItem {
    return this.dataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if(this.listeners.indexOf(listener) < 0){
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    let pos = this.listeners.indexOf(listener);
    if(pos >= 0){
      this.listeners.splice(pos,1);
    }
  }
}