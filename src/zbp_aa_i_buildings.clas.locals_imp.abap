CLASS lhc_zaa_i_buildings DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zaa_i_buildings RESULT result.

    METHODS validateNRooms FOR VALIDATE ON SAVE
      IMPORTING keys FOR zaa_i_buildings~validateNRooms.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE zaa_i_buildings.

    DATA: lv_timestamp      TYPE string,
          lv_create_at      TYPE string,
          lv_date_str       TYPE string,
          lv_day            TYPE string,
          lv_month          TYPE string,
          lv_year           TYPE string,
          lv_formatted_date TYPE string.

    DATA: lt_data        TYPE TABLE OF zaa_buildings,
          lt_unique_data TYPE TABLE OF zaa_buildings,
          ls_data        TYPE zaa_buildings,
          lt_created_at  TYPE TABLE OF zaa_buildings-created_at,
          lv_created_at  TYPE zaa_buildings-created_at.

    DATA: oref TYPE REF TO cx_root,
          text TYPE string.

ENDCLASS.

CLASS lhc_zaa_i_buildings IMPLEMENTATION.

  METHOD get_instance_authorizations.

*    READ ENTITIES OF zaa_i_buildings IN LOCAL MODE
*      ENTITY zaa_i_buildings
*      ALL FIELDS
*      WITH CORRESPONDING #( keys )
*      RESULT DATA(buildings)
*      FAILED DATA(building_failed).
**
*
*
*    LOOP AT buildings ASSIGNING FIELD-SYMBOL(<lfs_buildings>).
*
*      lv_create_at = <lfs_buildings>-created_at.
*      lv_date_str = lv_create_at+0(8).
*
*
*      lv_year  = lv_date_str+0(4). " Year: '2024'
*      lv_month = lv_date_str+4(2). " Month: '07'
*      lv_day   = lv_date_str+6(2). " Day: '22'
*
*      lv_formatted_date = lv_day && '.' && lv_month && '.' && lv_year.

*    ENDLOOP.


  ENDMETHOD.

  METHOD validateNRooms.

    TYPES:BEGIN OF ty_date,
            date(10) TYPE c,
          END OF ty_date.

    DATA:lt_date TYPE TABLE OF  ty_date,
         ls_date TYPE ty_date.

    DATA: lv_date(10) TYPE c.



    SELECT
      a~created_at
    FROM zaa_buildings AS a
    INTO TABLE @DATA(lt_createdat).

    LOOP AT lt_createdat INTO DATA(ls_created).


*      DATA(lv_formatted_date) = |{ lv_date+6(2) }.{ lv_date+4(2) }.{ lv_date+0(4) }|.

*      CALL METHOD cl_abap_tstmp=>timet_to_tstmp
*        EXPORTING
*          time_t = ls_created-created_at
*        IMPORTING

    endloop.

*    DATA gt_building TYPE TABLE FOR UPDATE zaa_i_buildings.
*
*
*    READ ENTITIES OF zaa_i_buildings IN LOCAL MODE
*       ENTITY zaa_i_buildings
*        ALL FIELDS
*          WITH CORRESPONDING #( keys )
*          RESULT DATA(lt_buildings)
*      FAILED    DATA(lt_failed)
*      REPORTED  DATA(lt_reported).
*
*    DATA(today) = cl_abap_context_info=>get_system_date( ).
*
*    LOOP AT lt_buildings ASSIGNING FIELD-SYMBOL(<lfs_buildings>).
*
*      <lfs_buildings>-created_at = today.
*
*    ENDLOOP.


*    try.
*        MODIFY ENTITIES OF zaa_i_buildings IN LOCAL MODE
*        ENTITY zaa_i_buildings
*        UPDATE
*        FIELDS ( created_at )
*        WITH VALUE #( FOR key IN keys ( %tky = key-%tky created_at = today ) ).
*
*      CATCH  cx_root INTO oref.
*        text = oref->get_text( ).
*
*    ENDTRY.
**
*    lv_create_at = sy-datum.
*    lv_date_str = lv_create_at+0(8).
*
*
*    lv_year  = lv_date_str+0(4). " Year: '2024'
*    lv_month = lv_date_str+4(2). " Month: '07'
*    lv_day   = lv_date_str+6(2). " Day: '22'
*
*    lv_formatted_date = lv_day && '.' && lv_month && '.' && lv_year.
*
*
*
*    TRY.

*        MODIFY ENTITIES OF zaa_i_buildings IN LOCAL MODE
*        ENTITY zaa_i_buildings
*        UPDATE
*        FIELDS ( created_at )
*        WITH VALUE #( FOR key IN keys ( %tky = key-%tky created_at = lv_formatted_date ) )
*        FAILED DATA(failedd)
*        REPORTED DATA(reportedd).
*
*      CATCH  cx_root INTO oref.
*        text = oref->get_text( ).
*
*    ENDTRY.
*
*    "ekrana getirebilmek için okumak gerekiyor
*    READ ENTITIES OF zaa_i_buildings IN LOCAL MODE
*    ENTITY zaa_i_buildings
*    ALL FIELDS WITH CORRESPONDING #( keys )
*    RESULT DATA(data)..
*
*
**    SELECT created_at
**      FROM zaa_i_buildings
**      INTO TABLE @DATA(lt_existing_records).


    ENDMETHOD.

    METHOD earlynumbering_create.
*
*    DATA(today) = cl_abap_context_info=>get_system_date( ).
*    DATA(lv_formatted_date) = |{ today+6(2) }.{ today+4(2) }.{ today+0(4) }|.

      SELECT MAX( building_id ) FROM zaa_buildings INTO @DATA(new_id).

        LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_ent>).
          new_id = new_id + 1.

          INSERT VALUE #( %cid = <lfs_ent>-%cid
                            building_id = new_id
                            ) INTO TABLE mapped-zaa_i_buildings.

        ENDLOOP.

      ENDMETHOD.

ENDCLASS.
