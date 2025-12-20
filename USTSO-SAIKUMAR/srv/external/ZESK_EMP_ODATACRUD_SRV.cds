/* checksum : 62339140e2f162dc5bbf87b580d1978c */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZESK_EMP_ODATACRUD_SRV {
  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.content.version : '1'
  entity ZEMP_LISTSet {
    @sap.unicode : 'false'
    @sap.label : 'Emp ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key EmpId : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Name'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EmpName : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'DEP_NAME'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EmpDept : String(20) not null;
    @sap.unicode : 'false'
    @sap.label : 'SAL'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EmpSalary : Integer not null;
  };
};

