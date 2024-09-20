CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.
    DATA make         TYPE string.
    DATA model        TYPE string.
    DATA speed_in_kmh TYPE i.

    CLASS-DATA number_of_vehicles TYPE i.

    " public void accelerate(int value) { speedInKmh += value; }
    METHODS accelerate
      IMPORTING !value TYPE i.

    " public void brake(int value) throws InvalidValueException {
    "   if (value > speedInKmh) {
    "     throw new InvalidValueException();
    "   }
    "
    "   speedInkmh -= value;
    " }
    METHODS brake
      IMPORTING !value TYPE i
      RAISING   cx_abap_invalid_value.

    " public String toString() { return make + ", " + model + ", " + speedInKmh + "kmh"; }
    METHODS to_string
      RETURNING VALUE(dummy) TYPE string.

ENDCLASS.


CLASS lcl_vehicle IMPLEMENTATION.
  METHOD accelerate.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW cx_abap_invalid_value( ).
    ENDIF.

    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD to_string.
    dummy = |{ make } { model } ({ speed_in_kmh }kmh)|.
    " return |{ make } { model } ({ speed_in_kmh }kmh)|.
  ENDMETHOD.
ENDCLASS.
