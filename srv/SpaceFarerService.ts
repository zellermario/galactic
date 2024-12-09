import { SpaceFarer, SpaceFarerService } from "#cds-models/SpaceFarerService";

const SpaceFarerServiceHandlers = (service: SpaceFarerService) => {

  service.before("CREATE", SpaceFarer, async ({ data }) => {
    
  });

  service.after("CREATE", SpaceFarer, async (_, request) => {
    const spaceFarer = request.data;
    
  });

}

//export { SpaceFarerService };
