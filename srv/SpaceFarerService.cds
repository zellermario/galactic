using {db} from '../db/DataModel';

@(requires: 'authenticated-user')
service SpaceFarerService {

  @(
    odata.draft.enabled,
    restrict: [
      { grant: ['READ','WRITE'], where: '$user.originPlanetID = originPlanet_ID' }
    ]
  )
  entity SpaceFarer as
    projection on db.SpaceFarer {
      *,
      @readonly originPlanet.name        as originPlanetName,
      @readonly position.name            as positionName,
      @readonly position.department.name as departmentName
    }
    actions {
      action launch()
    }

  event SpaceFarerLaunched {
    ID           : Integer;
    name         : String;
    emailAddress : String;
  }

}
