import { LightningElement } from 'lwc';

export default class Numerator extends LightningElement {
    counter = 0;
  handleIncrement() {
      console.log(1);
    this.counter++;
  }
  handleDecrement() {
      console.log(2);
    this.counter--;
  }
  handleMultiply(event) {
    const factor = event.detail;
    this.counter *= factor;
  }
}