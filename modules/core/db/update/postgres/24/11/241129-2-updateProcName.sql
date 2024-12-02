update WF_PROC set code='OnlineCreditOrderProcess', card_types =',garant$CreditOrder,', update_ts=now(), updated_by='system'
where name = 'Согласование и выдача кредита'
^
