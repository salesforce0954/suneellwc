import { LightningElement,api } from 'lwc';

export default class MeetingRoom extends LightningElement {

    @api meetingRoomInfo;

    @api showRoomInfo = false;

    tileClickHandler(){
        console.log(2);
        const tileClicked = new CustomEvent('tileclick', {detail : this.meetingRoomInfo});
        this.dispatchEvent(tileClicked);
        console.log(3);
    }
}