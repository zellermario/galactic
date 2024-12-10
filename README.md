# How to start the application

In the root folder:
1. First run `npm install` to install the required dependencies.
2. Then run `cds-tsx build` to generate the required TypeScript files from the model.
3. Then emit `cds deploy --to sqlite:galactic.db`. This will deploy the database schema and some dummy data to an sqlite file at `./galactic.db`. This will serve as the database of the application.
4. Finally run `npm run start` to start the application. If you would like the application to restart on file changes, use `npm run watch` instead.

# How to access the application

The application will be available at http://localhost:4004, where you can navigate to the Fiori web application or browse the OData endpoints.

You need to use HTTP Basic Authentication to access the application or the API endpoints. The available mock users are the same as the ones listed [here](https://cap.cloud.sap/docs/node.js/authentication#mock-users). Any password gets accepted.

Since only those SpaceFarers are listed that come from the same planet as the authenticated user, you might wanna use `alice` or `bob` to log in, because their users already have a planet assigned to them in the `package.json` file.
