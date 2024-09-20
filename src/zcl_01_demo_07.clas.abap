CLASS zcl_01_demo_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_01_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " SELECT <Spalte 1>, <Spalte 2>, ...
    "   FROM <Datenbankquelle>
    "   WHERE <Bedingung>

    DATA carrier_id   TYPE /dmo/carrier_id VALUE 'LH'.
    DATA flight_price TYPE /dmo/flight_price.

    DATA flight_prices type table of  /dmo/flight_price.

    " Lesender Zugriff auf einen Datensatz
    SELECT SINGLE FROM /dmo/flight
      FIELDS price
      WHERE carrier_id = @carrier_id AND connection_id = '0400' AND flight_date = '20240707'
      INTO @flight_price. " INTO @DATA(flight_price).

    SELECT SINGLE FROM /dmo/flight
      fields *
      WHERE carrier_id = @carrier_id AND connection_id = '0400' AND flight_date = '20240707'
      INTO @final(flight).

      " Lesender Zugriff auf mehrere Datensätze
      select from /dmo/flight
        fields price
        where carrier_id = @carrier_id
        into table @flight_prices.

    out->write( flight_price ).
  ENDMETHOD.
ENDCLASS.
