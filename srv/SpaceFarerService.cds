using { db } from '../db/DataModel';

@(requires: 'authenticated-user')
service SpaceFarerService {

  @odata.draft.enabled
  entity SpaceFarer as projection on db.SpaceFarer {
    *,
    originPlanet.name as originPlanetName,
    position.name as positionName,
    position.department.name as departmentName,
  }

}
