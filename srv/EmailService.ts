import { log } from "@sap/cds";
import { validate as isValidEmail } from "email-validator";
import { SendLauchEmail, EmailService } from "#cds-models/EmailService";

const EmailServiceHandlers = (service: EmailService, ) => {

  service.on(SendLauchEmail, async({ data: { emailAddress }, reject }) => {
    if (!emailAddress || !emailAddress.trim()) {
      return reject(`Email address must not be null or empty.`)
    }
    if (!isValidEmail(emailAddress)) {
      return reject(`Email address '${emailAddress}' is not valid.`);
    }
    
    const subject = "Successful launch";
    const body = "Congratulations on starting your cosmic journey. Bon voyage!";
    mockEmailSending(emailAddress, subject, body);
  });

  function mockEmailSending(to: string, subject: string, body: string) {
    const emailLogger = log("email");
    const message = `An email has been sent.
    To: ${to}
    Subject: ${subject}
    Message: ${body}`;
    emailLogger.log(message);
  }

}

export default EmailServiceHandlers;