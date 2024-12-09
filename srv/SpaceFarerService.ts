import { SpaceFarer, SpaceFarerService, SpaceFarerLaunched } from "#cds-models/SpaceFarerService";
import { validate as isValidEmail } from "email-validator";

const SpaceFarerServiceHandlers = (service: SpaceFarerService) => {

  service.before(['CREATE', 'UPDATE'], SpaceFarer, (req) => {
    const { emailAddress } = req.data;
    if (!emailAddress) {
      return req.reject(422, "Email address cannot be empty.");
    }
    if (!isValidEmail(emailAddress)) {
      return req.reject(422, "Please provide a valid email address.");
    }
  });

  service.on(SpaceFarer.actions.launch.name, async (req) => {
    const [spaceFarerId] = req.params;
    const { ID, name, emailAddress, stardustCollectionSkill, wormholeNavigationSkill }
      = await service.read<SpaceFarer>(SpaceFarer.name, spaceFarerId);

    if (!stardustCollectionSkill || stardustCollectionSkill < 4) {
      req.error(422, "You need at least a 4-star stardust collection skill to launch.");
    }
    if (!wormholeNavigationSkill || wormholeNavigationSkill < 4) {
      req.error(422, "You need at least a 4-star wormhole navigation skill to launch.");
    }

    service.emit(SpaceFarerLaunched.name, {
      ID,
      name,
      emailAddress
    } as SpaceFarerLaunched);

    req.notify(200, "Successful launch.");
  });

}

export default SpaceFarerServiceHandlers;
