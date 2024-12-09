using { cuid } from '@sap/cds/common';

namespace db;

type RGBColor : String @assert.format : '^#[0-9a-f]{6}$';
type SkillLevel : Integer @assert.range : [0, 5];

entity SpaceFarer : cuid {
  key ID                   : Integer;
  name                     : String @mandatory;
  emailAddress             : String @(mandatory, assert.unique);
  spaceSuitColor           : RGBColor @mandatory;
  stardustCollectionSkill  : SkillLevel @mandatory;
  wormholeNavigationSkill  : SkillLevel @mandatory;
  originPlanet             : Association to Planet @assert.target @assert.notNull;
  position                 : Association to Position @assert.target;
}

entity Planet {
  key ID      : Integer;
  name        : String @mandatory;
  coordinate  : CosmicCoordinate @mandatory;
}

entity Position {
  key ID     : Integer;
  name       : String @mandatory;
  department : Association to Department @assert.target @assert.notNull;
}

entity Department : cuid {
  key ID : String;
  name   : String @mandatory;
}

type CosmicCoordinate {
  x: Decimal(32, 16);
  y: Decimal(32, 16);
  z: Decimal(32, 16);
}
