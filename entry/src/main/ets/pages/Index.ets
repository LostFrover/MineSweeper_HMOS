import { promptAction } from '@kit.ArkUI';

export  interface game_para {
  row: number
  col: number
  mines: number
  mode: boolean
}

@Entry
@Component
struct Index {
  @Provide('nav') nav: NavPathStack = new NavPathStack();
  @State pa: game_para = {
    row: 9,
    col: 9,
    mines: 10,
    mode: false
  };

  build() {
    Navigation(this.nav) {
      Column() {
        Text($r("app.string.Title_str"))
          .textAlign(TextAlign.Center)
          .id('Title')
          .fontSize($r("app.float.Index_Title_font_size"))
          .fontWeight(FontWeight.Bold)
        Button('初级')
          .onClick(() => {
            this.pa.row = 9;
            this.pa.col = 9;
            this.pa.mines = 10;
            this.nav.pushPath({ name: 'GamePage', param: this.pa })
          })
        Button('中级')
          .onClick(() => {
            this.pa.row = 16;
            this.pa.col = 16;
            this.pa.mines = 40;
            this.nav.pushPath({ name: 'GamePage', param: this.pa })
          })
        Button('高级')
          .onClick(() => {
            this.pa.row = 30;
            this.pa.col = 16;
            this.pa.mines = 99;
            this.nav.pushPath({ name: 'GamePage', param: this.pa })
          })
        Button('自定义')
          .onClick(() => {
          })
        Row() {
          Text('倒计时模式')
          Toggle({ type: ToggleType.Switch, isOn: false })
          .onChange((isOn: boolean) => {
            this.pa.mode = isOn;
            promptAction.showToast({ 'message': `倒计时模式${isOn ? '打开' : '关闭'}` })
          })
        }.justifyContent(FlexAlign.End)
      }
      .height('100%')
      .width('100%')
    }
  }
}