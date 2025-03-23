//块数据类
class Block {
  public mined: boolean = false;
  public isOpen: boolean = false;
  public mineCount: number | null = null;
  row: number;
  col: number;

  constructor(row: number, col: number) {
    this.row = row;
    this.col = col;
  }

  public open() {
    this.isOpen = true;
    if (this.mined) {
      end_game()
    }
  }
}

function end_game() {

}

let block_0: Block = new Block(0, 0)

// 游戏运行页面
@Entry
@Component
export struct GamePage {
  @Consume('nav') nav: NavPathStack;
  @State counter: number = 0;
  @State row: number = 0;
  @State col: number = 0;
  @State mines: number = 0;
  @State mode: boolean = false;

  aboutToAppear(): void {
    this.row = Number(this.nav.getParamByName('row'))
    this.col = Number(this.nav.getParamByName('col'))
    this.mines = Number(this.nav.getParamByName('mines'))
    this.mode = Boolean(this.nav.getParamByName('mode'))
  }

  build() {
    NavDestination() {
      Column() {
        Text(`${this.counter}`)
          .textAlign(TextAlign.Center)
          .id('counter')
          .fontSize($r("app.float.Index_Title_font_size"))
          .fontWeight(FontWeight.Bold)
        Grid() {

        }

  }
}
}
}


//自订块组件
@Component
struct MineBlock {
  @State row: number = 0;
  @State col: number = 0;
  @State block: Block = block_0;

  build() {
    Button({ type: ButtonType.ROUNDED_RECTANGLE }) {
      // 状态显示
      if (!this.block.isOpen) {
        Text('')
          .foregroundColor(Color.Blue)
      } else if (this.block.mined) {
        Text('*')
          .foregroundColor(Color.Red)
      } else {
        Text(`${this.block.mineCount}`)
          .foregroundColor(Color.Pink)
      }
    }
    .onClick(() => {
      this.block.open()
    })

  }
}



