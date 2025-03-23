import GamePageTest from './GamePage.test'
import localUnitTest from './LocalUnit.test';

export default function testsuite() {
  localUnitTest();
  GamePageTest()
}