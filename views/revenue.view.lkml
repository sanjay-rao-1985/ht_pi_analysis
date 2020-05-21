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
    label: "Invoice Resale Price"
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
    label: "End Cust Territory"
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
    label: "Avg Net Price"
    drill_fields: [quote, quoteline, customer, part]
    value_format_name: decimal_4
    sql: ${netprice} ;;
   # html: {{ customer }}   {{rendered_value}} ;;
  }

  measure: avg_netprice_min {
    type: min
    label: "Net Price Min"
    value_format_name: decimal_4
    sql: ${TABLE}.NETPRICE ;;
    }

  measure: avg_netprice_25th {
    type: percentile
    percentile:  25
    label: "Net Price 25th Percentile"
    value_format_name: decimal_4
    sql: ${TABLE}.NETPRICE ;;
    }

  measure: avg_netprice_median {
    type: median
    label: "Net Price Median"
    value_format_name: decimal_4
    sql: ${TABLE}.NETPRICE ;;
    }

  measure: avg_netprice_75th {
    type: percentile
    percentile:  75
    label: "Net Price 75th Percentile"
    value_format_name: decimal_4
    sql: ${TABLE}.NETPRICE ;;
    }

  measure: avg_netprice_max {
    type: max
    label: "Net Price Max"
    value_format_name: decimal_4
    sql: ${TABLE}.NETPRICE ;;
    }

  measure: total_netrevenue {
    type: sum
    label: "Total Net Revenue"
    value_format_name: decimal_2
    sql: ${netrevenue} ;;
  }

  measure: total_qty {
    type: sum
    value_format_name: decimal_0
    sql: ${qty} ;;
  }

  measure: avg_resaleprice {
    type: average
    label: "Avg Resale Price"
    value_format_name: decimal_4
    sql: ${resaleprice} ;;
  }

  measure: volume_compliance {
    type: number
    label: "Volume % Compliance"
    value_format_name: percent_0
    sql: ${total_qty}/${quote.total_quantity} ;;
  }

}
