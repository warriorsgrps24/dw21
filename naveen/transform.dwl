%dw 2.0
output application/json
import * from dw::core::Arrays
//importing arrays
var lookup = [
  {
    "AccountId__c": "1202378",
    "RecordId": "0124W000001hC6BQA1",
    "Company": "1570"
  },
  {
    "AccountId__c": "1202379",
    "RecordId": "0124W000001hC6BQ2U",
    "Company": "1570"
  },
  {
    "AccountId__c": "1202380",
    "RecordId": "0124W000001hC6BQ3AU",
    "Company": "1570"
  }
]
---

leftJoin(payload, lookup, (payload)->payload.AccountId, (lookup)-> lookup.AccountId__c) map ((item, index) -> item.l  update {
        case .RecordId -> item.r.RecordId default $
    }
 )
//using left join payload and var and with id we can map data  and using update function to take default values of ids