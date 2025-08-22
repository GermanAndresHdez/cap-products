using {sapbackend as external} from './external/sapbackend';

define service SAPbackendExit {

    entity Incidents as select from external.IncidentsSet;
}
