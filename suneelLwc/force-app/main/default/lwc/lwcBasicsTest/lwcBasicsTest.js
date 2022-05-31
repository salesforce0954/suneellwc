import { LightningElement } from 'lwc';

export default class LwcBasicsTest extends LightningElement {
    firstNumber;
    secondNumber;
    result;
    
    retInput(event) {
        const inputName = event.target.name;
     if(inputName == 'fNumber'){
         this.firstNumber = event.target.value;
     }else if(inputName == 'sNumber'){
         this.secondNumber = event.target.value;
     }
    }

    additionHandler() {
        const fn = parseInt(this.firstNumber);
        const ln = parseInt(this.secondNumber);
        this.result = fn + ln;
    }
}