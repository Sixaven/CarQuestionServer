export default class PersonItemData{
  title: string
  image: Resource
  other?: string

  constructor(title: string,image: Resource, other?: string) {
    this.title = title;
    this.image = image;
    this.other = other;
  }
}