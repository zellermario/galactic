using { db } from '../db/DataModel';

@(requires: 'authenticated-user')
service SpaceFarerService {

  entity SpaceFarer as projection on db.SpaceFarer;

}
