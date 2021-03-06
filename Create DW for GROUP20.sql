USE [IMSTAYDW]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 12/06/2021 10:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[SK_Time] [int] NOT NULL,
	[Time_ID] [int] NOT NULL,
	[Time_date] [datetime] NULL,
	[Time_day_number] [int] NULL,
	[Time_day_name] [nvarchar](50) NULL,
	[Time_day_name_short] [nvarchar](20) NULL,
	[Time_week_number] [int] NULL,
	[Time_month_number] [int] NULL,
	[Time_month_name] [nvarchar](50) NULL,
	[Time_month_name_short] [nvarchar](10) NULL,
	[Time_trimester_number] [int] NULL,
	[Time_trimester_name] [nvarchar](20) NULL,
	[Time_semester_number] [int] NULL,
	[Time_semester_name] [nvarchar](50) NULL,
	[Time_year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Host]    Script Date: 12/06/2021 10:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Host](
	[SK_Host] [int] IDENTITY(1,1) NOT NULL,
	[BK_Host] [int] NULL,
	[Host_Name] [nvarchar](50) NULL,
	[Host_Category] [nvarchar](50) NULL,
	[Host_Active_Since] [datetime] NULL,
	[Host_Active_Years] [int] NULL,
	[Host_SCD_Start_Date] [datetime] NULL,
	[Host_SCD_End_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_Host] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_House]    Script Date: 12/06/2021 10:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_House](
	[SK_House] [int] IDENTITY(1,1) NOT NULL,
	[BK_House] [int] NOT NULL,
	[House_Type] [nvarchar](50) NULL,
	[House_Name] [nvarchar](50) NULL,
	[House_SCD_Start_Date] [datetime] NULL,
	[House_SCD_End_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_House] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Location]    Script Date: 12/06/2021 10:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Location](
	[SK_Location] [int] IDENTITY(1,1) NOT NULL,
	[BK_Location] [int] NOT NULL,
	[Location_Latitute] [decimal](18, 6) NULL,
	[Location_Longitude] [decimal](18, 6) NULL,
	[Location_PostalCode] [int] NULL,
	[Location_MunicipalitySubdivision] [nvarchar](50) NULL,
	[Location_Municipality] [nvarchar](50) NULL,
	[Location_CountrySecondarySubdivision] [nvarchar](50) NULL,
	[Location_CountrySubdivision] [nvarchar](50) NULL,
	[Location_Country] [nvarchar](50) NULL,
	[Location_Country_Code] [nvarchar](50) NULL,
	[Location_CountryCodeISO3] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Review]    Script Date: 12/06/2021 10:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Review](
	[SK_Review] [int] IDENTITY(1,1) NOT NULL,
	[BK_Review] [nvarchar](15) NOT NULL,
	[Review_Star] [decimal](2, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_Review] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Min_Night]    Script Date: 12/06/2021 10:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Min_Night](
	[FK_House] [int] NOT NULL,
	[FK_Time] [int] NOT NULL,
	[FK_Location] [int] NOT NULL,
	[House_Min_Night] [int] NULL,
 CONSTRAINT [PK_Fact_Min_Night] PRIMARY KEY CLUSTERED 
(
	[FK_House] ASC,
	[FK_Time] ASC,
	[FK_Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Price]    Script Date: 12/06/2021 10:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Price](
	[FK_Time] [int] NOT NULL,
	[FK_Location] [int] NOT NULL,
	[FK_Host] [int] NOT NULL,
	[FK_House] [int] NOT NULL,
	[Avg_Price] [numeric](30, 2) NULL,
	[Rel_Price_Difference] [numeric](30, 4) NULL,
	[Abs_Price_Difference] [numeric](30, 2) NULL,
 CONSTRAINT [PK_Fact_Price] PRIMARY KEY CLUSTERED 
(
	[FK_Time] ASC,
	[FK_Location] ASC,
	[FK_House] ASC,
	[FK_Host] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Review]    Script Date: 12/06/2021 10:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Review](
	[FK_Time] [int] NOT NULL,
	[FK_Location] [int] NOT NULL,
	[FK_Review] [int] NOT NULL,
	[FK_House] [int] NOT NULL,
	[Review_Star] [decimal](2, 1) NULL,
 CONSTRAINT [PK_Fact_Review] PRIMARY KEY CLUSTERED 
(
	[FK_Time] ASC,
	[FK_Location] ASC,
	[FK_Review] ASC,
	[FK_House] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_Min_Night]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Min_Night_Dim_Date] FOREIGN KEY([FK_Time])
REFERENCES [dbo].[Dim_Date] ([SK_Time])
GO
ALTER TABLE [dbo].[Fact_Min_Night] CHECK CONSTRAINT [FK_Fact_Min_Night_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Min_Night]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Min_Night_Dim_House] FOREIGN KEY([FK_House])
REFERENCES [dbo].[Dim_House] ([SK_House])
GO
ALTER TABLE [dbo].[Fact_Min_Night] CHECK CONSTRAINT [FK_Fact_Min_Night_Dim_House]
GO
ALTER TABLE [dbo].[Fact_Min_Night]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Min_Night_Dim_Location] FOREIGN KEY([FK_Location])
REFERENCES [dbo].[Dim_Location] ([SK_Location])
GO
ALTER TABLE [dbo].[Fact_Min_Night] CHECK CONSTRAINT [FK_Fact_Min_Night_Dim_Location]
GO
ALTER TABLE [dbo].[Fact_Price]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Price_Dim_Date] FOREIGN KEY([FK_Time])
REFERENCES [dbo].[Dim_Date] ([SK_Time])
GO
ALTER TABLE [dbo].[Fact_Price] CHECK CONSTRAINT [FK_Fact_Price_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Price]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Price_Dim_Host] FOREIGN KEY([FK_Host])
REFERENCES [dbo].[Dim_Host] ([SK_Host])
GO
ALTER TABLE [dbo].[Fact_Price] CHECK CONSTRAINT [FK_Fact_Price_Dim_Host]
GO
ALTER TABLE [dbo].[Fact_Price]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Price_Dim_House] FOREIGN KEY([FK_House])
REFERENCES [dbo].[Dim_House] ([SK_House])
GO
ALTER TABLE [dbo].[Fact_Price] CHECK CONSTRAINT [FK_Fact_Price_Dim_House]
GO
ALTER TABLE [dbo].[Fact_Price]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Price_Dim_Location] FOREIGN KEY([FK_Location])
REFERENCES [dbo].[Dim_Location] ([SK_Location])
GO
ALTER TABLE [dbo].[Fact_Price] CHECK CONSTRAINT [FK_Fact_Price_Dim_Location]
GO
ALTER TABLE [dbo].[Fact_Review]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Review_Dim_Date] FOREIGN KEY([FK_Time])
REFERENCES [dbo].[Dim_Date] ([SK_Time])
GO
ALTER TABLE [dbo].[Fact_Review] CHECK CONSTRAINT [FK_Fact_Review_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Review]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Review_Dim_House] FOREIGN KEY([FK_House])
REFERENCES [dbo].[Dim_House] ([SK_House])
GO
ALTER TABLE [dbo].[Fact_Review] CHECK CONSTRAINT [FK_Fact_Review_Dim_House]
GO
ALTER TABLE [dbo].[Fact_Review]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Review_Dim_Location] FOREIGN KEY([FK_Location])
REFERENCES [dbo].[Dim_Location] ([SK_Location])
GO
ALTER TABLE [dbo].[Fact_Review] CHECK CONSTRAINT [FK_Fact_Review_Dim_Location]
GO
ALTER TABLE [dbo].[Fact_Review]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Review_Dim_Review] FOREIGN KEY([FK_Review])
REFERENCES [dbo].[Dim_Review] ([SK_Review])
GO
ALTER TABLE [dbo].[Fact_Review] CHECK CONSTRAINT [FK_Fact_Review_Dim_Review]
GO
