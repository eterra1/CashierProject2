require 'oci8'

def read_titcket_data
  conn  = OCI8.new('TITO_SCHEMA','TITO_SCHEMA','172.28.23.65:1521')

  conn.exec("Select TICKET_CODE from (select TICKET.TICKET_CODE , TICKET_ACTION.TICKET_ID ,TICKET.TICKET_ID,TICKET.LOCAL_DATE_CREATED from TICKET inner JOIN TICKET_ACTION on TICKET.TICKET_ID = TICKET_ACTION.TICKET_ID where  TICKET.TICKET_STATE = 1   and TICKET_ACTION.HO_VENUE_CODE = '900242' order by TICKET.TICKET_ID desc) where ROWNUM = 1") do |record|
    @valid_ticket_bar_code = record.join(',')
  end

  conn.exec("Select TICKET_CODE from (select TICKET.TICKET_CODE , TICKET_ACTION.TICKET_ID ,TICKET.TICKET_ID,TICKET.LOCAL_DATE_CREATED from TICKET inner JOIN TICKET_ACTION on TICKET.TICKET_ID = TICKET_ACTION.TICKET_ID where  TICKET.TICKET_STATE = 4   and TICKET_ACTION.HO_VENUE_CODE = '900242' order by TICKET.TICKET_ID desc) where ROWNUM = 1") do |record|
    @redeemed_ticket_bar_code = record.join(',')
  end

  conn.exec("Select TICKET_CODE from (select TICKET.TICKET_CODE , TICKET_ACTION.TICKET_ID ,TICKET.TICKET_ID,TICKET.LOCAL_DATE_CREATED from TICKET inner JOIN TICKET_ACTION on TICKET.TICKET_ID = TICKET_ACTION.TICKET_ID where  TICKET.TICKET_STATE = 4   and TICKET_ACTION.HO_VENUE_CODE = '800103' order by TICKET.TICKET_ID desc) where ROWNUM = 1") do |record|
    @redeemed_ticket_bar_code_different_venue = record.join(',')
  end

  conn.exec("Select TICKET_CODE from (select TICKET.TICKET_CODE , TICKET_ACTION.TICKET_ID ,TICKET.TICKET_ID,TICKET.LOCAL_DATE_CREATED from TICKET inner JOIN TICKET_ACTION on TICKET.TICKET_ID = TICKET_ACTION.TICKET_ID where  TICKET.TICKET_STATE = 1   and TICKET_ACTION.HO_VENUE_CODE = '800103' order by TICKET.TICKET_ID desc) where ROWNUM = 1") do |record|
    @valid_ticket_bar_code_different_venue = record.join(',')
  end

  conn.logoff

end