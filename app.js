import express from 'express';
import cors from 'cors';
import { Activity } from './activity.js';

const app = express();
app.use(cors());
app.use(express.json());
const PORT = process.env.PORT || 3000;

// This resets all the data once you restart the server. 
let activities = []

/** 
 * GET endpoint to get all the activities.
 * 
 * This endpoint returns an array of all the activities in the server.
 */
app.get('/', (request, response) => {
     response.send(activities);
})


/**
 * POST endpoint to add a new activity.
 * 
 * This endpoint receives activity data in the request body and creates a new activity.
 * It validates the presence of required fields in the request body. If any required field
 * is missing, it responds with a 400 status code and an error message.
 * 
 * @param {object} request - The request object from the client.
 * @param {object} request.body - The body of the request containing activity data.
 * @param {string} request.body.title - The title of the activity.
 * @param {number} request.body.timeToComplete - The time required to complete the activity.
 * @param {string} request.body.description - The description of the activity.
 * @param {array} request.body.competencies - The competencies involved in the activity.
 * @param {array} request.body.toolsNeeded - The tools needed for the activity.
 * @param {object} response - The response object to send back the response.
 * 
 * @return {void} Returns nothing. Sends a response to the client.
 * If successful, sends the created activity data.
 * If validation fails, sends an error message with a 400 status code.
 */
app.post('/addActivity', (request, response) => {
    if(!request.body.title) {
        return response.status(400).send('Title is required')
    }
    if(!request.body.timeToComplete) {
        return response.status(400).send('Time to Complete is required')
    }
    if(!request.body.description) {
        return response.status(400).send('Description is required')   
    }
    if(!request.body.competencies) {
        return response.status(400).send('Competencies is required. You can pass an empty array.')
    }
    if(!request.body.toolsNeeded) {
        return response.status(400).send('Tools Needed is required. You can pass an empty array.')
    }

    const activity = new Activity(request.body.title, request.body.timeToComplete, request.body.description, request.body.competencies, request.body.toolsNeeded)
    activities.push(activity)
    response.send(activities)
})


app.listen(PORT, () => {
    console.log(`Server is Listening on ${PORT}`)
})