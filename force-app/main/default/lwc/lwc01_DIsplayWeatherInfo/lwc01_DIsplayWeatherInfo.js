/* eslint-disable no-console */

import { LightningElement,wire,api, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import getAccount from '@salesforce/apex/C01_DisplayWeatherInfo.getAccount'
import { getSObjectValue } from '@salesforce/apex';


export default class Lwc01_DIsplayWeatherInfo extends LightningElement {
    @api recordId;
    @track objectType;
    @track Temperature;
    @track Humidity;
    @track windSpeed;
    @track temp4;
    @track city;


    // @wire(getSObjectValue, { recordId: '$recordId'})
    // recordidd;

    // @wire(getRecord, { recordId: '$recordId'})
    // record;

        @wire( getAccount,{recordId: '$recordId'})
        wireAccount({error,data}){
            if(data){
                console.log('data' + JSON.stringify(data)); 
            }
            else if(error)
            console.log('error' + JSON.stringify(error));
        }

    // constructor(){
    //     super();
    //     console.log('this.recordId' + this.recordId);
    //     getAccount({id: this.recordId})
    //     .then(data => {
    //         console.log('data' + JSON.stringify(data));
    //     },error => {
    //         console.log('error' + JSON.stringify(error));
    //     })

    // }
}