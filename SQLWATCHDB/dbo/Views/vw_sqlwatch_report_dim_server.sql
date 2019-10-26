﻿CREATE VIEW [dbo].[vw_sqlwatch_report_dim_server] with schemabinding
as
SELECT [physical_name]
      ,sql_instance = [servername]
	  ,[servername] --PBI backward compatibility with old reports.
      ,[service_name]
      ,[local_net_address]
      ,[local_tcp_port]
      ,d.[utc_offset_minutes]
	  ,c.environment
  FROM [dbo].[sqlwatch_meta_server] d
  inner join dbo.sqlwatch_config_sql_instance c
	on d.servername = c.sql_instance
