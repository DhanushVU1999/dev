import { LightningElement } from 'lwc';

export default class Lwc2 extends LightningElement {
    message = false;
    handleButtonClick(event){
        this.message = !(this.message);
    }
}