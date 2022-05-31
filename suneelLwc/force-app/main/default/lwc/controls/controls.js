import { LightningElement } from 'lwc';

export default class Controls extends LightningElement {

    handleAdd() {
        console.log(3);
        this.dispatchEvent(new CustomEvent('add'));
      }
      handleSubtract() {
          console.log(4);
        this.dispatchEvent(new CustomEvent('subtract'));
      }
      handleMultiply(event) {
        const factor = event.target.dataset.factor;
        this.dispatchEvent(new CustomEvent('multiply', {
          detail: factor
        }));
      }
}