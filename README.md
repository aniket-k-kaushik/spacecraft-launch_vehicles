## Step 1 - Spacecraft and launch vehicles

1. Design a database structure for storing details of launch vehicles and spacecraft, where each launch vehicle can launch multiple spacecraft
2. Implement associations in the model to easily find:
    1. Which launch vehicle launched a given spacecraft
    2. The list of spacecraft launched by a launch vehicle
3. Implement a CRUD API for launch vehicles and spacecraft

## Step 2 - Payload weights

1. Add fields to store
    1. Weight for spacecraft
    2. Payload capacity for launch vehicles
2. Add this validation
    1. The sum of the spacecraft weights that can be assigned to a launch vehicle should be under the payload capacity of the launch vehicle.
3. Update the API
    1. Include the extra field values in responses
    2. Include appropriate validation / error messages while trying to create / update

## Step 3 - Reusable launch vehicles

1. Add the ability to mark launch vehicles as reusable
2. Update the DB and model associations to be able to store data about multiple launches per launcher. Track a date for the launch model.
3. Add these validations:
    1. Launch vehicles that are reusable can have multiple launches
    2. Non-reusable launch vehicles can have only one launch
4. Update the API for the added functionality, including validation errors
    1. Update the response of the GET endpoint for spacecraft to include the launch details (launch vehicle and date)
    2. For a given launch vehicle, an endpoint to retrieve a list of launches and the list of spacecraft in each launch
