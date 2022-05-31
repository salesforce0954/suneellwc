import { LightningElement,track } from 'lwc';

export default class MeetingRooms extends LightningElement {

    @track showMeetingRoomInfo;

    meetingRoomsInfo = [
        {roomName : 'A-01',roomCapacity: '10'},
        {roomName : 'A-02',roomCapacity: '11'},
        {roomName : 'A-03',roomCapacity: '12'},
        {roomName : 'A-04',roomCapacity: '13'},
        {roomName : 'A-05',roomCapacity: '14'},
        {roomName : 'A-06',roomCapacity: '15'}

    ]

    handletile(event){
        console.log(9);
        const meetingRoomInfos = event.detail;
        console.log('meetingRoomInfos'+meetingRoomInfos);
        this.showMeetingRoomInfo = meetingRoomInfos.roomName;

    }
}