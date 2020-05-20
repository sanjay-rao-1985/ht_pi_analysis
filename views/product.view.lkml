view: product {
  sql_table_name: PI_DEMO.PRODUCT ;;

  dimension: expr1 {
    type: string
    sql: ${TABLE}.EXPR1 ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.FAMILY ;;
  }

  dimension: family_description__c {
    type: string
    sql: ${TABLE}.FAMILY_DESCRIPTION__C ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.PRODUCT ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}.PRODUCTCODE ;;
  }

  dimension: registerable_product__c {
    type: number
    sql: ${TABLE}.REGISTERABLE_PRODUCT__C ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
