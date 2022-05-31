import { LightningElement,track } from 'lwc';

export default class SimpleCalculator extends LightningElement {

    @track currentResult;
    @track previousResult = [];
    @track showPreviousResult = false;
    firstNumber;
    secondNumber;


    numberChangeHandler(event){
        const inputBoxNumber = event.target.name;
        if(inputBoxNumber == 'firstNumber'){
            this.firstNumber = event.target.value;
        }else if(inputBoxNumber == 'secondNumber'){
            this.secondNumber = event.target.value;
        }
        
    }

    addHandler(){
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        this.currentResult = 'Result of '+firstN+ '+ ' +secondN+ 'is '+(firstN+secondN);
        this.previousResult.push(this.currentResult);
        //this.currentResult = `Result of ${firstN}+${secondN} is ${firstN+secondN}`;
    }

    

    subHandler(){
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        this.currentResult = 'Result of '+firstN+ '- ' +secondN+ 'is '+(firstN-secondN);
        this.previousResult.push(this.currentResult);
        //this.currentResult = 'Result of ${firstN} - ${secondN} is ${firstN - secondN}';
    }

    multiplyHandler(){
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        this.currentResult = 'Result of '+firstN+ '* ' +secondN+ 'is '+(firstN*secondN);
        this.previousResult.push(this.currentResult);
        //this.currentResult = 'Result of ${firstN} * ${secondN} is ${firstN * secondN}';
    }

    divisionHandler(){
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        this.currentResult = 'Result of '+firstN+ '/ ' +secondN+ 'is '+(firstN/secondN);
        this.previousResult.push(this.currentResult);
        //this.currentResult = 'Result of ${firstN} / ${secondN} is ${firstN / secondN}';
    }

    previousResultToogle(event){
        this.showPreviousResult = event.target.checked;

    }
}