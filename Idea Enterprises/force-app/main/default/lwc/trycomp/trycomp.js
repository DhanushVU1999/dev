import { api, track, LightningElement } from 'lwc';
import retrieveCase from '@salesforce/apex/TryApex.RetrieveCase';

export default class Trycomp extends LightningElement {
    msg = '';
    @track cases;
    @track response1 = [];
    @track formattedRecords = [];
    @track CaseFields = [];

    handleInputChange(event) {
        this.msg = event.target.value;
        this.handleparamSend();
    }

    handleparamSend() {
        retrieveCase({ limitNum: this.msg })
            .then(response => {
                this.response1 = response;

                if (response.length > 0) {
                    this.CaseFields = Object.keys(response[0]);
                    this.formattedRecords = response.map(record => ({
                        key: record.Id,
                        values: this.CaseFields.map(field => record[field])
                    }));
                } else {
                    this.CaseFields = [];
                    this.formattedRecords = [];
                }
                console.log("hhhhhh",this.formattedRecords);
                this.cases = JSON.stringify(this.formattedRecords);
            })
            .catch(error => {
                console.error("Error fetching cases:", error);
            });
    }
}