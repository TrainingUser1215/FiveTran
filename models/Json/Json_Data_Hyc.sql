SELECT
    J._LINE,
    J.AUTHOR_UID,
    J.FIRST_NAME,
    J.LAST_NAME,
    cd.value:"Address"."Permanent address"::STRING AS permanent_address,
    cd.value:"Address"."current Address"::STRING AS current_address,
    cd.value:"phoneNumbers"."number"::STRING AS phone_number,
    cd.value:"phoneNumbers"."type"::STRING AS phone_type
FROM
    MYDB.TRANSFORMED.JSON_HCY AS J,
    LATERAL FLATTEN(input => J.CONTACT_DETAILS) cd