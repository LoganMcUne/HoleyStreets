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

        <div class="subtitle-box-claim-form">
            <p class="subtitle-claim-form"><em>Enter your information below to file a damage claim.</em></p>
            <p class="subtitle-claim-form"><em>Your claim will be reviewed by a Holey Streets administrator, and they will contact you with next steps in the claims process.</em></p>
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
                    required
                    />
                </div>
                <div class="form-element">
                    <label for="lastName">Last Name:</label><br />
                    <input
                    type="text"
                    id="lastName"
                    name="lastName"
                    v-model="claimForm.lastName"
                    required
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
                    required
                    />
                </div>
                <div class="form-element">
                    <label for="phoneNumber">Phone Number:</label><br />
                    <input
                    type="text"
                    id="phoneNumber"
                    name="phoneNumber"
                    v-model="claimForm.phoneNumber"
                    required
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
                <div class="form-element">
                <label for="locationOfincidentCity">Damage Location (City):</label><br />
                <input
                type="text"
                id="locationOfincidentCity"
                name="locationOfincidentCity"
                v-model="claimForm.locationOfincidentCity"
                required
                />
                </div>
                <div class="form-element">
                    <label for="locationOfincidentState">Damage Location (State):</label><br />
                    <input
                    type="text"
                    id="locationOfincidentState"
                    name="locationOfincidentState"
                    v-model="claimForm.locationOfincidentState"
                    />
                </div>
            </div>
            <div class="form-element">
                <label for="imageLink">Link to Picture of Damage (optional):</label><br />
                <input
                type="text"
                id="imageLink"
                name="imageLink"
                v-model="claimForm.imageLink"
                />
            </div>
            <div class="form-element damage-description">
                <label class="description-of-damage" for="descriptionOfDamage">Please enter a detailed description of the damage caused by a pothole <em>(max. 1200 characters)</em>:</label>
                <textarea id="descriptionOfDamage" name="descriptionOfDamage" v-model="claimForm.descriptionOfDamage" />
            </div>
            <button type="submit" class="submit-button" v-on:submit.prevent="submitClaimForm">
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
                firstName: '',
                lastName: '',
                email: '',
                phoneNumber: '',
                dateOfClaim: '',
                dateOfIncident: '',
                locationOfincidentCity: '',
                locationOfincidentState: '',
                imageLink: '',
                descriptionOfDamage: '',
            }
        }
    },
    methods: {
        submitClaimForm() {
            const today = new Date();
            this.claimForm.dateOfClaim = today.toJSON();

            claimFormService.submitClaimForm(this.claimForm)
            .then(response => {
                if (response.status === 200) {
                    alert("Thank you! We will never get back to you about this.");
                }
                this.claimForm = {};
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

<style scoped>
form {
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 98vw;
    align-items: center;
}

div.form-block {
    display: flex;
    flex-direction: row;
    gap: 20px;
}

button.submit-button {
    width: 150px;
    margin-bottom: 20px;
    background-color: #acd178;
}

#imageLink {
    width: 300px;
}

div.damage-description {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.description-of-damage {
    width: 42vw;
}

textarea {
    width: 42vw;
    height: 6vw;
}
</style>