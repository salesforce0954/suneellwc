import { LightningElement,track } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    @track displayDiv = false;
    @track listCity = ['Hyderabad','Udaipur','Srinagar'];
    showDivHandler(event){
        this.displayDiv = event.target.checked;
    }

}