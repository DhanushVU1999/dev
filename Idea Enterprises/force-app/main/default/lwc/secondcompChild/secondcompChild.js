import { api,track,LightningElement } from 'lwc';

export default class SecondcompChild extends LightningElement {
    @api childArr;
    @api boolVal;
    //filterarray = [];

    @api childfunction(){
        const filterarray = this.childArr.filter(item => item.locallink.length > 0)
        console.log('getting filterarray in childcomponet',filterarray)
        const evnt = new CustomEvent('countevent', {detail : filterarray.length});
        console.log('getting evnt in childcomponet',evnt.detail)
        this.dispatchEvent(evnt);
            
    }
}