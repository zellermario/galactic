using { cuid } from '@sap/cds/common';

namespace db;

type RGBColor : String @assert.format : '^#[0-9a-f]{6}$';
type SkillLevel : Integer @assert.range : [0, 100];

entity SpaceFarer : cuid {
  name                     : String @mandatory;
  emailAddress             : String @(mandatory, assert.unique);
  spaceSuitColor           : RGBColor @mandatory;
  stardustCollectionSkill  : SkillLevel @mandatory;
  wormholeNavigationSkill  : SkillLevel @mandatory;
  originPlanet             : Association to Planet @assert.target @assert.notNull;
  position                 : Association to Position @assert.target;
}

entity Planet : cuid {
  name        : String @mandatory;
  coordinate  : CosmicCoordinate @mandatory;
}

entity Position : cuid {
  name       : String @mandatory;
  department : Association to Department @assert.target @assert.notNull;
}

entity Department : cuid {
  name : String @mandatory;
}

type CosmicCoordinate {
  x: Decimal(32, 16);
  y: Decimal(32, 16);
  z: Decimal(32, 16);
}
