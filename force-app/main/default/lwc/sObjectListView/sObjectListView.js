import { LightningElement, api } from 'lwc';
import getRecords from '@salesforce/apex/sObjectListViewController.getRecords';

export default class SObjectListView extends LightningElement {
    records;
    error;

    @api sOQLString;
    @api nameField;
    @api imageField;
    @api backgroundColour;
    connectedCallback() {
        getRecords({searchString: this.sOQLString, nameField: this.nameField, imageField: this.imageField})
            .then((result) => {
                this.records = result;
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.records = undefined;
            });
        }
    renderedCallback() {
        this.template.
            querySelector(".sobjlv__backgrounddiv").
            style.setProperty("--background-colour", this.backgroundColour);
    }    
}