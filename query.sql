SELECT id, name, country_code, distance, gender, preferences
FROM (SELECT
        id
        , name
        , country_code
        , (
            6371 *
            acos(
                cos( radians( :paramLatitude ) ) *
                cos( radians( latitude ) ) *
                cos(
                    radians( longitude ) - radians( :paramLongitude )
                ) +
                sin( radians( :paramLatitude ) ) *
                sin( radians( latitude ) )
            )
          ) distance, gender, preferences
      FROM cleaner
      ORDER BY distance) subQuery
WHERE country_code
  LIKE ':country'
    AND distance < ':maxDistance'
    AND gender LIKE ':gender'
    :preferensesSQL;
