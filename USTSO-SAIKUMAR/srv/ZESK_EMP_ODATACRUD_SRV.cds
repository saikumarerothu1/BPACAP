using ZESK_EMP_ODATACRUD_SRV from './external/ZESK_EMP_ODATACRUD_SRV.cds';

service ZESK_EMP_ODATACRUD_SRVSampleService {
    @readonly
    entity ZEMP_LISTSet as projection on ZESK_EMP_ODATACRUD_SRV.ZEMP_LISTSet
    {        key EmpId, EmpName, EmpDept, EmpSalary     }    
;
}