import { LightningElement,track, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import CreateAccount from '@salesforce/apex/CreateAccount.cAccount';
import LabelValue from '@salesforce/label/c.Record_Link';

export default class Secondcomp extends LightningElement {
    @track arr =[]
    idstring ;
    Label1 = LabelValue;
    arrbool = false;
    bool1 = false; //child component renders only after 'click here' button is clicked
    bool2 = false;  //passing to child component
    count=0;
    wirevar1;
    wirevar2;
    @wire (getRecord, { recordId : '$idstring', fields : ['Account.Name', 'Account.Industry']})
    wiredAccounts({data,error}) {
        if(data){
            console.log('getting data from wire' + JSON.stringify(data))
            this.wirevar1 = data.fields.Name.value;
            this.wirevar2 = data.fields.Industry.value;
            console.log('getting wirevar1' + this.wirevar1)
            console.log('getting wirevar2' + this.wirevar2)
        }
        else if(error){
            console.error('error in wire' + error)
        }
    }

    
    handlecallback = () => {
        console.log('getting device details', navigator.userAgent)
        console.log('getting into function' + this.arr)
        const accNameInput = this.template.querySelector('.accNam')
        console.log('getting input name ka value' + accNameInput.value)
        const accIndusInput = this.template.querySelectorAll('input')
        console.log('getting input industry ka value' + accIndusInput[1].value)
        const arrobj = {
            accName : accNameInput.value,
            accIndustry : accIndusInput[1].value,
            locallink : '',
            bool3: true //Plus button rendering
        }
        console.log('getting the individual obj ---' + arrobj)
        if((accNameInput.value.length) > 0  && (accIndusInput[1].value.length) > 0 && this.arr.length == 0){
            console.log('getting into if loop')
            this.arr.push(arrobj)
        }
        else{
            for(let item of this.arr){
                console.log('getting into for loop')
                if((accNameInput.value.length) > 0  && (accIndusInput[1].value.length) > 0 && (item.accName != accNameInput.value)){
                    this.arr.push(arrobj)
                    break;
                    console.log('getting as expected in if',item,'',JSON.stringify(this.arr))
                } else if(item.accName === accNameInput.value){
                    console.log('Account already exists',item.accName)
                    console.log('Account already exists',accNameInput.value)
                    alert('Account already exists')
                } else {
                    alert('Please enter the values')
                    console.error('Please enter the values')
                }
            }
        }
        if(this.arr.length > 0){
            this.arrbool = true;
        }
        console.log('getting into array in function 1' , JSON.stringify(this.arr))

        accNameInput.value = '';
        accIndusInput[1].value = '';
        //console.log('button clicked' + event)
    }

    handleclick(event) {
        this.bool1 = true;
        console.log('getting into function 2');
        const currentAccname = event.target.getAttribute('data-var1');
        const currentAccIndustry = event.target.getAttribute('data-var2');
        const currentAcc = {
            accName : currentAccname,
            accIndustry : currentAccIndustry
        }
        console.log('getting button clicked 2----' , JSON.stringify(currentAcc));
        CreateAccount({accfields:JSON.stringify(currentAcc)})
        .then( (result) => {
            this.idstring = JSON.parse(result);
            let linkconcat = this.Label1 + this.idstring + '/view';
            console.log('getting the linkconcat  ' + linkconcat);
            for(let item of this.arr){
                if(item.accName === currentAccname){
                    item.locallink = linkconcat
                    item.bool3 = false
                    if(item.locallink.length >0){
                        this.bool2 = true;
                    }
                }
            }
            
            
            const childcomp = this.template.querySelector('.fetch-count')
            childcomp.childfunction();
        })
    } 
    handlechilddetail(event){
        this.count = event.detail
    }      
    


}