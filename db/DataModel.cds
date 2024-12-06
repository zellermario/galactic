using { cuid } from '@sap/cds/common';

namespace db;

type RGBColor : String @assert.format : '^#[0-9a-f]{6}$';

entity SpaceFarer : cuid {
  originPlanet          : Association to Planet;
  spaceSuitColor        : RGBColor;
  staffMembers          : Association to many StaffMember;
  canCollectStarDust    : Boolean;
  canNavigateWormHoles  : Boolean;
}

entity Planet : cuid {
  name        : String;
  coordinate  : CosmicCoordinate
}

entity StaffMember : cuid {
  firstName : String;
  lastName  : String;
  position  : Association to Position;
}

entity Position : cuid {
  name       : String;
  department : Association to Department;
}

entity Department : cuid {
  name : String;
}

type CosmicCoordinate {
  x: Decimal(64, 32);
  y: Decimal(64, 32);
  z: Decimal(64, 32);
}
