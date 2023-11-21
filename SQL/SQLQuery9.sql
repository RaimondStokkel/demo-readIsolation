SELECT TOP (10) "11031235"."timestamp",
                "11031235".[Entry No_],
                "11031235".[Line No_],
                "11031235".[User ID],
                "11031235"."Document ID",
                Datalength("11031235"."Template Document"),
                Datalength("11031235"."Merge Document"),
                Datalength("11031235"."Merge Document Xml"),
                Datalength("11031235"."Merge Data")
FROM
 [mydatabase].[dbo].[MeerstedeWonen$Server Processing Job Queue$85ddad32-cc73-4581-b6fb-83d8dc4bbe17] "11031235" WITH(readuncommitted)
WHERE  ( "11031235"."DateTime Updated" = @1
         AND "11031235"."Entry No_" = @2
         AND "11031235"."Line No_" < @3
          OR "11031235"."DateTime Updated" = @1
             AND "11031235"."Entry No_" < @2
          OR "11031235"."DateTime Updated" < @1 )
ORDER  BY "DateTime Updated" DESC,
          "Entry No_" DESC,
          "Line No_" DESC
OPTION(optimize FOR unknown, fast 50) 