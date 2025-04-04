import { game_para } from 'ets/pages/Index'

interface block {
  row: number
  col: number
  isOpen: boolean
  mined: boolean
  mineCount: number
}

function initial_block_array(row: number, col: number): Array<block> {
  let tmp: block[] = []
  for (let i = 0; i < row; i++) {
    for (let j = 0; j < col; j++) {
      tmp.push({
        row: i,
        col: j,
        isOpen: false,
        mined: false,
        mineCount: 0
      })
    }
  }
  return tmp
}

@Builder
export function GamePageBuilder(name: string, param: game_para) {
  NavDestination() {
    Text(`${name}`)
    Text(`${param.row.toString() + param.col.toString() + param.mines.toString() + param.mode.toString()}`)
      .fontColor(Color.Orange)

    GamePage({
      row: param.row,
      col: param.col,
      mines: param.mines,
      mode: param.mode,
      block_array: initial_block_array(param.row, param.col)
    })
  }
}

// 游戏运行页面
@Component
export struct GamePage {
  @State @Watch('endGame') started: number = -1;
  @State counter: number = 0;
  @Prop row: number
  @Prop col: number
  @Prop mines: number
  @Prop mode: boolean
  @State block_array: Array<block> = []

  endGame(): void {
    if (this.started) {
      return
    }
    this.enabled(false)
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
          ForEach(this.block_array, (one: block) => {
            MineBlock({ started: this.started, block: one }).width(`${95/this.col}%`)
          })
        }.backgroundColor(Color.Gray).layoutWeight(1)
        .maxCount(this.col)

      }
    }
  }
}


//自订块组件
@Component
struct MineBlock {
  @Link started: number
  @State block: block = {
    row: 0,
    col: 0,
    isOpen: false,
    mined: false,
    mineCount: 0
  }

  build() {
    Button({ type: ButtonType.ROUNDED_RECTANGLE }) {
      // 状态显示
      if (!this.block.isOpen) {
        Text(' ')
          .foregroundColor(Color.Blue)
      } else if (this.block.mined) {
        Text('*')
          .foregroundColor(Color.Red)
      } else {
        Text(`${this.block.mineCount}`)
          .foregroundColor(Color.Pink)
      }
    }
    .layoutWeight(1)
    .onClick(() => {
      if(this.started<0){

      }

    })

  }
}



