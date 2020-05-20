view: revenue {
  sql_table_name: PI_DEMO.REVENUE ;;

  dimension: application {
    type: string
    sql: ${TABLE}.APPLICATION ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.CUSTOMER ;;
  }

  dimension_group: invoicedate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.INVOICEDATE ;;
  }

  dimension: netprice {
    type: number
    sql: ${TABLE}.NETPRICE ;;
  }

  dimension: netrevenue {
    type: number
    sql: ${TABLE}.NETREVENUE ;;
  }

  dimension: part {
    type: string
    sql: ${TABLE}.PART ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.QTY ;;
  }

  dimension: quote {
    type: string
    sql: ${TABLE}.QUOTE ;;
  }

  dimension: quoteline {
    type: string
    sql: ${TABLE}.QUOTELINE ;;
  }

  dimension: resaleprice {
    type: number
    sql: ${TABLE}.RESALEPRICE ;;
  }

  dimension: saleschannel {
    type: string
    sql: ${TABLE}.SALESCHANNEL ;;
  }

  dimension: shipanddebit {
    type: string
    sql: ${TABLE}.SHIPANDDEBIT ;;
  }

  dimension: shiptoendcustterritory {
    type: string
    sql: ${TABLE}.SHIPTOENDCUSTTERRITORY ;;
  }

  dimension: shiptosalesempgeocode {
    type: string
    sql: ${TABLE}.SHIPTOSALESEMPGEOCODE ;;
  }

  dimension: shiptosalesempregionname {
    type: string
    sql: ${TABLE}.SHIPTOSALESEMPREGIONNAME ;;
  }

  dimension: soldto {
    type: string
    label: "Sold To"
    sql: ${TABLE}.SOLDTO ;;
  }

  measure: count {
    type: count
    drill_fields: [shiptosalesempregionname]
  }

  measure: avg_netprice {
    type: average
    drill_fields: [quote, quoteline, customer, part]
    value_format_name: decimal_2
    sql: ${netprice} ;;
   # html: {{ customer }}   {{rendered_value}} ;;
  }

  measure: total_netrevenue {
    type: sum
    sql: ${netrevenue} ;;
  }

  measure: total_qty {
    type: sum
    value_format_name: decimal_0
    sql: ${qty} ;;
  }

  measure: avg_resaleprice {
    type: average
    sql: ${resaleprice} ;;
  }

}
