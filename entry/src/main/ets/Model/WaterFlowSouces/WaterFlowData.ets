export  interface IUserItem{
  image: Resource;

  text: string;

  image_head: Resource;

  like_state: boolean;

  like_num: number;
}

export default class UserItem implements IUserItem{
  image: Resource;

  text: string

  image_head: Resource;

  like_state: boolean;

  like_num: number;

  constructor(image: Resource,text: string,image_head: Resource,like_state: boolean,like_num: number) {
    this.image = image
    this.image_head = image_head
    this.text = text
    this.like_state = like_state
    this.like_num = like_num
  }
}