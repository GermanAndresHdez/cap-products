using {sapbackend as external} from './external/sapbackend.csn';

define service SAPbackendExit {

    @cds.persistence: {
        table,
        skip: false
    }
    @cds.autoexpose
    // entity Incidents as select from external.IncidentsSet;
    entity Incidents as projection on external.IncidentsSet;
}

@protocol: 'rest'
service RestService {

    entity Incidents as projection on SAPbackendExit.Incidents;

}
