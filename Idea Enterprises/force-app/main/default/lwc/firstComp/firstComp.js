import { LightningElement } from 'lwc';

export default class FirstComp extends LightningElement {
    message = '';
    handleChange(event){
        this.message = event.target.value;
    }
}