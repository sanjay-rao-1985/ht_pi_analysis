view: quote {
  sql_table_name: PI_DEMO.QUOTE ;;

  dimension: customer {
    type: string
    sql: ${TABLE}.CUSTOMER ;;
  }

  dimension: distimargin {
    type: number
    sql: ${TABLE}.DISTIMARGIN ;;
  }

  dimension: distributor_cost__c {
    type: number
    sql: ${TABLE}.DISTRIBUTOR_COST__C ;;
  }

  dimension: part {
    type: string
    sql: ${TABLE}.PART ;;
  }

  dimension: price__c {
    type: number
    sql: ${TABLE}.PRICE__C ;;
  }

  dimension: quantity__c {
    type: number
    sql: ${TABLE}.QUANTITY__C ;;
  }

  dimension: quote {
    type: string
    sql: ${TABLE}.QUOTE ;;
  }

  dimension_group: quote_effective_date__c {
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
    sql: ${TABLE}.QUOTE_EFFECTIVE_DATE__C ;;
  }

  dimension_group: quote_expiration_date__c {
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
    sql: ${TABLE}.QUOTE_EXPIRATION_DATE__C ;;
  }

  dimension: quoteline {
    type: string
    primary_key: yes
    sql: ${TABLE}.QUOTELINE ;;
  }

  dimension: recordtype {
    type: string
    sql: ${TABLE}.RECORDTYPE ;;
  }

  dimension: resale_price__c {
    type: number
    sql: ${TABLE}.RESALE_PRICE__C ;;
  }

  dimension: shipanddebit {
    type: string
    sql: ${TABLE}.SHIPANDDEBIT ;;
  }

  dimension: soldto {
    type: string
    sql: ${TABLE}.SOLDTO ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_price {
    type: average
    sql: ${price__c} ;;
  }

  measure: total_quantity {
    type: sum
    sql: ${quantity__c} ;;
  }

  measure: avg_resale_price {
    type: average
    sql: ${resale_price__c} ;;
  }

  measure: sum_distimargin {
    type: sum
    sql: ${distimargin} ;;
  }

  measure:avg_distributor_cost {
    type: average
    sql: ${distributor_cost__c} ;;
  }

}
