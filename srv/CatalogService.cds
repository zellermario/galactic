using { db } from '../db/DataModel';

@(requires: 'authenticated-user')
service CatalogService {

  @readonly entity Department as projection on db.Department;
  @readonly entity Position as projection on db.Position;
  @readonly entity Planet as projection on db.Planet;

}