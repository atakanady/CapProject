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
        
      @EndUserText:{label: 'ID '}
  key building_id,
      @EndUserText.label: 'Created At'
      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 20 }]
  key created_at,
      @UI: { lineItem: [{ position: 10 }],
      identification: [{ position: 10 }],
      selectionField: [{ position: 10 }] }
      @EndUserText:{label: 'Building Name '}
      building_name,
      @UI: { lineItem: [{ position: 20 }],
      identification: [{ position: 20 }] }
      @EndUserText:{label: 'No of Rooms '}
      n_rooms,
      @UI: { lineItem: [{ position: 30 }],
      identification: [{ position: 30 }] }
      @UI.fieldGroup: [{ qualifier: 'Address', position: 10 }]
      @EndUserText:{label: 'Adress Line '}
      address_line,
      @UI: { lineItem: [{ position: 40 }],
      identification: [{ position: 40 }] }
      @UI.fieldGroup: [{ qualifier: 'Address', position: 20 }]
      @EndUserText:{label: 'City'}
      city,
      @UI: { lineItem: [{ position: 50 }],
      identification: [{ position: 50 }] }
      @UI.fieldGroup: [{ qualifier: 'Address', position: 30 }]
      @EndUserText:{label: 'State'}
      state,
      @UI: { lineItem: [{ position: 60 }],
      identification: [{ position: 60 }] }
      @UI.fieldGroup: [{ qualifier: 'Address', position: 40 }]
      @EndUserText:{label: 'Country '}
      country,
      @Semantics.user.createdBy: true
      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 10 }]
      @EndUserText:{label: 'Created by'}
      created_by

}
