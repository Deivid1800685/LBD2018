USE [Bar]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bebidas]') AND type in (N'U'))
ALTER TABLE [dbo].[Bebidas] DROP CONSTRAINT IF EXISTS [vAlcohol]
GO
/****** Object:  Index [idx_nombre]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP INDEX IF EXISTS [idx_nombre] ON [dbo].[Personal]
GO
/****** Object:  Index [idx_mesa]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP INDEX IF EXISTS [idx_mesa] ON [dbo].[Mesas]
GO
/****** Object:  Index [idx_evento]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP INDEX IF EXISTS [idx_evento] ON [dbo].[Eventos]
GO
/****** Object:  Index [idx_comida]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP INDEX IF EXISTS [idx_comida] ON [dbo].[Comida]
GO
/****** Object:  Index [idx_bebida]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP INDEX IF EXISTS [idx_bebida] ON [dbo].[Bebidas]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Personal]
GO
/****** Object:  Table [dbo].[Mesas]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Mesas]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Eventos]
GO
/****** Object:  Table [dbo].[Comida]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Comida]
GO
/****** Object:  Table [dbo].[Bebidas]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Bebidas]
GO
USE [master]
GO
/****** Object:  Database [Bar]    Script Date: 07/09/2018 01:34:05 p. m. ******/
DROP DATABASE IF EXISTS [Bar]
GO
/****** Object:  Database [Bar]    Script Date: 07/09/2018 01:34:05 p. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Bar')
BEGIN
CREATE DATABASE [Bar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [Bar] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bar] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bar] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bar] SET RECOVERY FULL 
GO
ALTER DATABASE [Bar] SET  MULTI_USER 
GO
ALTER DATABASE [Bar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bar] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bar', N'ON'
GO
ALTER DATABASE [Bar] SET QUERY_STORE = OFF
GO
USE [Bar]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Bar]
GO
/****** Object:  Table [dbo].[Bebidas]    Script Date: 07/09/2018 01:34:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bebidas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bebidas](
	[iId_bebida] [int] IDENTITY(1,1) NOT NULL,
	[vNombre] [varchar](50) NOT NULL,
	[alcohol] [varchar](10) NOT NULL,
	[contenidoNeto] [varchar](10) NOT NULL,
	[precio] [money] NOT NULL,
	[descripcion] [text] NOT NULL,
	[imagen] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[iId_bebida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Comida]    Script Date: 07/09/2018 01:34:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comida]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comida](
	[iId_comida] [int] IDENTITY(1,1) NOT NULL,
	[vNombre] [varchar](50) NOT NULL,
	[precio] [money] NOT NULL,
	[descripcion] [text] NOT NULL,
	[imagen] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[iId_comida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 07/09/2018 01:34:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Eventos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Eventos](
	[id_evento] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[nombre] [varchar](20) NULL,
	[descripcion] [varchar](100) NULL,
	[precioentrada] [money] NULL,
	[cargoxservicio] [money] NULL,
	[PrecioTotal]  AS ([precioentrada]+[cargoxservicio]),
PRIMARY KEY CLUSTERED 
(
	[id_evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Mesas]    Script Date: 07/09/2018 01:34:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mesas](
	[NoMesa] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[asientos] [varchar](20) NOT NULL,
	[lugar] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NoMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 07/09/2018 01:34:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Personal](
	[NoEmpleado] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellidos] [varchar](20) NULL,
	[Sexo] [char](1) NULL,
	[Tipo] [varchar](20) NULL,
	[areaTrabajo] [varchar](20) NULL,
	[turno] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[NoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_bebida]    Script Date: 07/09/2018 01:34:05 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Bebidas]') AND name = N'idx_bebida')
CREATE NONCLUSTERED INDEX [idx_bebida] ON [dbo].[Bebidas]
(
	[vNombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_comida]    Script Date: 07/09/2018 01:34:05 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Comida]') AND name = N'idx_comida')
CREATE NONCLUSTERED INDEX [idx_comida] ON [dbo].[Comida]
(
	[vNombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_evento]    Script Date: 07/09/2018 01:34:05 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Eventos]') AND name = N'idx_evento')
CREATE NONCLUSTERED INDEX [idx_evento] ON [dbo].[Eventos]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_mesa]    Script Date: 07/09/2018 01:34:05 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mesas]') AND name = N'idx_mesa')
CREATE NONCLUSTERED INDEX [idx_mesa] ON [dbo].[Mesas]
(
	[NoMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_nombre]    Script Date: 07/09/2018 01:34:05 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND name = N'idx_nombre')
CREATE NONCLUSTERED INDEX [idx_nombre] ON [dbo].[Personal]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[vAlcohol]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bebidas]'))
ALTER TABLE [dbo].[Bebidas]  WITH CHECK ADD  CONSTRAINT [vAlcohol] CHECK  (([alcohol] like '[0-6],[0-9]'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[vAlcohol]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bebidas]'))
ALTER TABLE [dbo].[Bebidas] CHECK CONSTRAINT [vAlcohol]
GO
USE [master]
GO
ALTER DATABASE [Bar] SET  READ_WRITE 
GO
