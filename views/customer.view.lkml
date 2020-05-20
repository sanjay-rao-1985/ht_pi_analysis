view: customer {
  sql_table_name: PI_DEMO.CUSTOMER ;;

  dimension: application_default {
    type: string
    sql: ${TABLE}.APPLICATION_DEFAULT ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.CUSTOMER ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}.PARENT ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
