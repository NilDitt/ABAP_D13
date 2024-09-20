CLASS zcl_01_main_vehicle DEFINITION
 PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_01_main_vehicle IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA vehicle  TYPE REF TO lcl_vehicle. " Vehicle vehicle;
    DATA vehicles TYPE TABLE OF REF TO lcl_vehicle.                       " List<Vehicle> vehicles = new ArrayList<>();

    vehicle = NEW #( ). " vehicle = new Vehicle();
    vehicle->make         = 'Porsche'.
    vehicle->model        = '911'.
    vehicle->speed_in_kmh = 50.
    APPEND vehicle TO vehicles.

    vehicle = NEW #( ).
    vehicle->make         = 'Audi'.
    vehicle->model        = 'A4'.
    vehicle->speed_in_kmh = 100.
    APPEND vehicle TO vehicles.

    vehicle = NEW #( ).
    vehicle->make         = 'Opel'.
    vehicle->model        = 'Zafira Life'.
    vehicle->speed_in_kmh = 180.
    APPEND vehicle TO vehicles.

    LOOP AT vehicles INTO vehicle.
      out->write( vehicle->to_string( ) ).
    ENDLOOP.

    vehicles[ 1 ]->accelerate( 50 ).
    TRY.
        vehicles[ 2 ]->brake( 150 ).
      CATCH cx_abap_invalid_value INTO FINAL(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    out->write( vehicles ).
  ENDMETHOD.
ENDCLASS.
