@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Buildings Interface View'

@UI.headerInfo:{
  typeName: 'Building',
  typeNamePlural: 'Buildings',
  typeImageUrl: 'sap-icon://building',
  title: {
    type: #STANDARD,
    value: 'building_name'
  },
  description.value: 'building_id'
}

define root view entity zaa_i_buildings
  as select from zaa_buildings
{


      @UI.facet: [{ id: 'Building',
          purpose: #STANDARD,
          type: #IDENTIFICATION_REFERENCE,
          label: 'Building',
          position: 10
        }, {
          id: 'addr',position:20,
          type: #FIELDGROUP_REFERENCE,
          targetQualifier: 'Address',
          label:'Address'
        }, {
          id:'log',position:30,
          type: #FIELDGROUP_REFERENCE,
          targetQualifier: 'ChangeLog',
          label:'Change Log'
        }]

      @UI: { lineItem: [{ position: 10 }],
      identification: [{ position: 10 }],
      selectionField: [{ position: 10 }] }
      @EndUserText:{label: 'ID '}
  key building_id,


      @UI: { lineItem: [{ position: 20 }],
      identification: [{ position: 20 }],
      selectionField: [{ position: 20 }] }
      @EndUserText:{label: 'Building Name '}
      building_name,
      @UI: { lineItem: [{ position: 30 }],
      identification: [{ position: 30 }] }
      @EndUserText:{label: 'No of Rooms '}
      n_rooms,

      @UI.fieldGroup: [{ qualifier: 'Address', position: 10 }]
      @EndUserText:{label: 'Adress Line '}
      address_line,
      @UI.fieldGroup: [{ qualifier: 'Address', position: 20 }]
      @EndUserText:{label: 'City'}
      city,
      @UI.fieldGroup: [{ qualifier: 'Address', position: 30 }]
      @EndUserText:{label: 'State'}
      state,
      @UI.fieldGroup: [{ qualifier: 'Address', position: 40 }]
      @EndUserText:{label: 'Country '}
      country,
      
      @Semantics.systemDateTime.createdAt: true
      @EndUserText.label: 'Created At'
      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 20 }]
      created_at

//      @Semantics.user.createdBy: true
//      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 10 }]
//      @EndUserText:{label: 'Created by'}
//      created_by,
//
//      @Semantics.user.lastChangedBy: true
//      @EndUserText.label: 'Last Changed By'
//      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 30 }]
//      last_changed_by,
//      @Semantics.systemDateTime.lastChangedAt: true
//      @EndUserText.label: 'Last Changed At'
//      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 40 }]
//      last_changed_at


}
