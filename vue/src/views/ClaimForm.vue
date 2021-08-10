<template>
    <div>
        <div class="title-and-pictures">
        <img
            class="left-pic tire-pic"
            src="../../public/tire_track_left.jpg"
            alt="Tire track picture"
        />
        <h1 class="centered-h1 title">Claim Form</h1>
        <img
            class="right-pic tire-pic"
            src="../../public/tire_track_right.jpg"
            alt="Tire track picture"
        />
        </div>

        <form class="claim-form" v-if="$store.state.token != ''">
            <div class="names form-block">
                <div class="form-element">
                    <label for="firstName">First Name:</label><br />
                    <input
                    type="text"
                    id="firstName"
                    name="firstName"
                    v-model="claimForm.firstName"
                    />
                </div>
                <div class="form-element">
                    <label for="lastName">Last Name:</label><br />
                    <input
                    type="text"
                    id="lastName"
                    name="lastName"
                    v-model="claimForm.lastName"
                    />
                </div>
            </div>
            <div class="contact-info form-block">
                <div class="form-element">
                    <label for="email">Email:</label><br />
                    <input
                    type="text"
                    id="email"
                    name="email"
                    v-model="claimForm.email"
                    />
                </div>
                <div class="form-element">
                    <label for="phoneNumber">Phone Number:</label><br />
                    <input
                    type="text"
                    id="phoneNumber"
                    name="phoneNumber"
                    v-model="claimForm.phoneNumber"
                    />
                </div>
            </div>
            <div class="dateOfIncident form-block">
                <div class="form-element">
                    <label for="dateOfIncident">Date of Damage:</label><br />
                    <input
                    type="date"
                    id="dateOfIncident"
                    name="dateOfIncident"
                    v-model="claimForm.dateOfIncident"
                    />
                </div>
            </div>
            <div class="locationOfDamage form-block">
                <div class="form-element">
                <label for="incidentCity">Damage Location (City):</label><br />
                <input
                type="text"
                id="incidentCity"
                name="incidentCity"
                v-model="claimForm.incidentCity"
                />
                </div>
                <div class="form-element">
                    <label for="incidentState">Damage Location (State):</label><br />
                    <input
                    type="text"
                    id="incidentState"
                    name="incidentState"
                    v-model="claimForm.incidentState"
                    />
                </div>
            </div>
            <div class="form-element">
                <label for="imageLink">Picture of Damage Link (optional):</label><br />
                <input
                type="text"
                id="imageLink"
                name="imageLink"
                v-model="claimForm.imageLink"
                />
            </div>
            <div class="form-element">
                <label for="descriptionOfDamage">Please enter a detailed description of the damage caused by a pothole <em>(max. 1200 characters)</em>:</label><br />
                <textarea id="" name="" rows="8" cols="75" />
            </div>
            <button class="submit-button" type="submit" v-on:submit.prevent="submitClaimForm">
            Submit Claim
            </button>
        </form>
    </div>
</template>

<script>
import claimFormService from '../services/ClaimFormService.js';

export default {
    name: "claim-form",
    data() {
        return {
            claimForm: {
                claimId: '',
                userId: '',
                fistName: '',
                lastName: '',
                email: '',
                phoneNumber: '',
                dateOfClaim: '',
                dateOfIncident: '',
                incidentCity: '',
                incidentState: '',
                imageLink: '',
                descriptionOfDamage: '',
                claimStatus: ''
            }
        }
    },
    methods: {
        submitClaimForm() {
            const today = new Date();
            this.claimForm.dateOfClaim = today;

            claimFormService.submitClaimForm(this.claimForm)
            .then(response => {
                console.log(response);
            })
            .catch(error => {
                this.handleError(error);
            })
        },
        handleError(error) {
            console.log(error);
        }
    }
}
</script>

<style>
form {
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 100vw;
    align-items: center;
}

div.form-block {
    display: flex;
    flex-direction: row;
    gap: 20px;
}

button.submit-button {
    width: 150px;
}

#imageLink {
    width: 300px;
}
</style>