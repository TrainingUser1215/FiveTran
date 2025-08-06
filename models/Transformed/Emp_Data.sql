SELECT
    TRIM(SPLIT_PART(data, 'Email', 1)) AS Name,
    REPLACE(REGEXP_SUBSTR(data, 'Email(.*?@@gmail\.com)', 1, 1, 'e'), '@@', '@') AS Email,
    TRIM(SPLIT_PART(TRIM(SPLIT_PART(data, 'com', 2)), ';', 1)) AS Age,
    TRIM(SPLIT_PART(SPLIT_PART(data, 'Gender', 1), '#Years', 2)) AS City,
    TRIM(SPLIT_PART(SPLIT_PART(data, 'Gender', 2), ' ', 1)) AS Gender
FROM (
    SELECT TRIM(REGEXP_REPLACE(value, '\\s+', ' ')) AS data
    FROM MYDB.TRANSFORMED.DIRTY_DATA_DIRTY_1
    CROSS JOIN LATERAL SPLIT_TO_TABLE(BIO_DATA_WITH_INFORMATION_ON_NAME_EMAIL_AGE_CITY_OF_BIRTH_AND_GENDER, '\n')
) t

WHERE data IS NOT NULL AND data != ''