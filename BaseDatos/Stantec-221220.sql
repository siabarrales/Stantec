USE [master]
GO
/****** Object:  Database [DSSTANTEC]    Script Date: 22-12-2020 17:54:05 ******/
CREATE DATABASE [DSSTANTEC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DSSTANTEC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DSSTANTEC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DSSTANTEC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DSSTANTEC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DSSTANTEC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DSSTANTEC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DSSTANTEC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DSSTANTEC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DSSTANTEC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DSSTANTEC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DSSTANTEC] SET ARITHABORT OFF 
GO
ALTER DATABASE [DSSTANTEC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DSSTANTEC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DSSTANTEC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DSSTANTEC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DSSTANTEC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DSSTANTEC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DSSTANTEC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DSSTANTEC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DSSTANTEC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DSSTANTEC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DSSTANTEC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DSSTANTEC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DSSTANTEC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DSSTANTEC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DSSTANTEC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DSSTANTEC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DSSTANTEC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DSSTANTEC] SET RECOVERY FULL 
GO
ALTER DATABASE [DSSTANTEC] SET  MULTI_USER 
GO
ALTER DATABASE [DSSTANTEC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DSSTANTEC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DSSTANTEC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DSSTANTEC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DSSTANTEC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DSSTANTEC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DSSTANTEC] SET QUERY_STORE = OFF
GO
USE [DSSTANTEC]
GO
/****** Object:  Table [dbo].[DS_Empresa]    Script Date: 22-12-2020 17:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DS_Empresa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[BaseDatos] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DS_Periodo]    Script Date: 22-12-2020 17:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DS_Periodo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mes] [varchar](50) NULL,
	[ano] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DS_TipoUsuario]    Script Date: 22-12-2020 17:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DS_TipoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[UrlInicio] [varchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DS_UsuarioEmpresa]    Script Date: 22-12-2020 17:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DS_UsuarioEmpresa](
	[IdUsuario] [int] NULL,
	[IdEmpresa] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DS_Usuarios]    Script Date: 22-12-2020 17:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DS_Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](100) NULL,
	[NombreCompleto] [varchar](100) NULL,
	[Contrasena] [varchar](1000) NULL,
	[CodigoUsuario] [varchar](100) NULL,
	[Email] [varchar](1000) NULL,
	[IdTipo] [int] NULL,
	[CentroCosto] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DS_Variables]    Script Date: 22-12-2020 17:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DS_Variables](
	[codVariable] [varchar](4) NOT NULL,
	[descripcion] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DS_Variables_Reporte]    Script Date: 22-12-2020 17:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DS_Variables_Reporte](
	[codVariable] [varchar](4) NOT NULL,
	[descripcion] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 22-12-2020 17:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id_Menu] [int] IDENTITY(1,1) NOT NULL,
	[Clase] [varchar](50) NULL,
	[PieMenu] [varchar](50) NULL,
	[Titulo] [varchar](200) NULL,
	[Action] [varchar](200) NULL,
	[Controler] [varchar](200) NULL,
	[Id_Perfil] [int] NULL,
	[Activo] [int] NULL,
	[Orden] [int] NULL,
	[IdEmpresa] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id_Menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DS_Empresa] ON 

INSERT [dbo].[DS_Empresa] ([Id], [Nombre], [BaseDatos]) VALUES (1, N'stantec', N'MWHAMERICA')
INSERT [dbo].[DS_Empresa] ([Id], [Nombre], [BaseDatos]) VALUES (2, N'', N'')
SET IDENTITY_INSERT [dbo].[DS_Empresa] OFF
GO
SET IDENTITY_INSERT [dbo].[DS_Periodo] ON 

INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (1, N'Enero', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (2, N'Febrero', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (3, N'Marzo', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (4, N'Abril', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (5, N'Mayo', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (6, N'Junio', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (7, N'Julio', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (8, N'Agosto', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (9, N'Septiembre', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (10, N'Octubre', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (11, N'Noviembre', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (12, N'Diciembre', N'2020')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (13, N'Enero', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (14, N'Febrero', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (15, N'Marzo', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (16, N'Abril', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (17, N'Mayo', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (18, N'Junio', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (19, N'Julio', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (20, N'Agosto', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (21, N'Septiembre', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (22, N'Octubre', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (23, N'Noviembre', N'2021')
INSERT [dbo].[DS_Periodo] ([id], [mes], [ano]) VALUES (24, N'Diciembre', N'2021')
SET IDENTITY_INSERT [dbo].[DS_Periodo] OFF
GO
SET IDENTITY_INSERT [dbo].[DS_TipoUsuario] ON 

INSERT [dbo].[DS_TipoUsuario] ([Id], [Nombre], [UrlInicio]) VALUES (1, N'Administrador', NULL)
INSERT [dbo].[DS_TipoUsuario] ([Id], [Nombre], [UrlInicio]) VALUES (2, N'Reporte', NULL)
SET IDENTITY_INSERT [dbo].[DS_TipoUsuario] OFF
GO
INSERT [dbo].[DS_UsuarioEmpresa] ([IdUsuario], [IdEmpresa]) VALUES (1, 1)
INSERT [dbo].[DS_UsuarioEmpresa] ([IdUsuario], [IdEmpresa]) VALUES (1, 2)
INSERT [dbo].[DS_UsuarioEmpresa] ([IdUsuario], [IdEmpresa]) VALUES (1001, 1)
GO
SET IDENTITY_INSERT [dbo].[DS_Usuarios] ON 

INSERT [dbo].[DS_Usuarios] ([Id], [NombreUsuario], [NombreCompleto], [Contrasena], [CodigoUsuario], [Email], [IdTipo], [CentroCosto]) VALUES (1, N'admin', N'Reporte', N'81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, 1, NULL)
INSERT [dbo].[DS_Usuarios] ([Id], [NombreUsuario], [NombreCompleto], [Contrasena], [CodigoUsuario], [Email], [IdTipo], [CentroCosto]) VALUES (1001, N'rep', N'rep', N'81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[DS_Usuarios] OFF
GO
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D001', N'Fondo de Pensiones')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D002', N'(AFP) Seg. Invalidez y Sobrev.')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D003', N'INP (Fonasa)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D004', N'Apagar Isapre')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D005', N'2% Adicional Isapre')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D006', N'Dos porciento real Isapre')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D007', N'Impuesto Unico')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D008', N'Pactado Proporcional Isapre')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D009', N'Ahorro AFP')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D010', N'Convenio Isapre')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D011', N'Salud 7%')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D012', N'Adicional  Salud')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D013', N'Prestamo Empresa UF')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D014', N'Prestamo Empresa Pesos')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D015', N'Convenio Gym')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D016', N'Ahorro voluntario CCAF')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D017', N'Pension Ley 18.156')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D018', N'Seguro USD 380,35')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D019', N'Salud Ley 18.156')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D020', N'Impto Unico Renta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D021', N'Cotizaciòn Salud Renta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D022', N'Cotizaciòn AFP Renta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D023', N'Adicional AFP Renta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D024', N'Cotizaciòn INP Renta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D025', N'Seguro Cesantia Aporte Trab.  Renta Acce')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D026', N'Seg Cesantia Aporte Empleador  Renta Acc')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D027', N'AFP Monto Cotiz SIS Empleador  Renta Acc')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D028', N'AFP Monto Cotiz SIS Trab  Renta Accesori')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D029', N'AFP Monto Cotiz Comisión  Renta Accesori')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D098', N'Total Descuentos Legales')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D099', N'Total Otros Descuentos')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D100', N'Préstamos Caja Compensación')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D101', N'Anticipo de Sueldo (No Ocupar)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D102', N'Seguro de Cesantía')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D103', N'Total Descuentos')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D104', N'Líquido a Pago')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D105', N'Sobregiro')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D106', N'Disponible')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D107', N'APV')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D108', N'base imponible inp')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D200', N'Total Anticipos de Sueldo')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D201', N'Anticipo de Sueldo')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D202', N'Ahorro Voluntario Dist. AFP')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D203', N'Entel (Celular)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D204', N'Estacionamiento')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D205', N'Seguro Complementario')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D206', N'Taxis ')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D207', N'Aguinaldo')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D208', N'Descto. Leyes Sociales (Rta.Accesoria)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D209', N'Diferencia de Isapre')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D210', N'Diferencia por rendicion de fondos')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D211', N'Otros')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D212', N'Descto.Impto.Unico (Renta Accesoria)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D213', N'Anticipo Renta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D214', N'Seguro Vida Corp')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D215', N'Depósito convenido')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D216', N'APV Regimen A')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D217', N'APV 2 Régimen A')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'D218', N'Sub Total O. Dsctos.')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H001', N'Sueldo Base')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H002', N'Sueldo del Mes')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H003', N'Gratificación Legal')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H004', N'Dif. Sueldo Base retroactivo')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H005', N'Hora Extras')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H006', N'Bono Stock Option')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H007', N'Bono licencia médica')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H010', N'Bono Terreno Retoactivo(Renta Accesoria)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H011', N'Bono 2014 (Renta Accesorias)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H025', N'Base Imponible INP  Renta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H030', N'Total Impon. c/Tope de Trab. Seg. Cesan')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H031', N'Base Imp. c/Tope del Empleador Seg Cesan')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H032', N'Renta Accesoria Liquida')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H033', N'Base Imponible Renta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H034', N'Renta Tributable Renta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H035', N'Base Imp. Trab Seg. Cesantia  Renta Acce')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H036', N'Base Imp. Emp Seg Cesantia  Renta Acc')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H090', N'Base Imponible')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H091', N'Base Tributable')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H095', N'Asignacion Licencia médica')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H096', N'Asignación teletrabajo')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H100', N'Asignacion Familiar Retroactiva')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H101', N'Asignación Familiar')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H102', N'Asignación de Movilización')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H103', N'Asignación de Colación')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H104', N'Bono 2013 (Renta Accesoria)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H105', N'Base Imponible Licencia')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H106', N'Indemnización Vacaciones')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H107', N'Desahucio')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H108', N'IAS')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H110', N'Bono Terreno Retroactivo (Rta.Accesoria)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H111', N'Convenio GYM')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H112', N'Dif. Horas Extra')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H113', N'Seguro USD380,35')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H120', N'Total Haberes No Imponibles')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H121', N'Total Ganado')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H122', N'Horas extra')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H123', N'Horas Extra')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H124', N'Bono Sala cuna')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H125', N'Bono Terreno')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H126', N'PARTICIPACION BRUTA')
GO
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H127', N'MAYOR RETENCION')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H128', N'REB.ZONA EXTREMA')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H129', N'Bono Terreno')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H130', N'Bono Nacimiento / Matrimonio / otros')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H131', N'Diferencia gratificación legal')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H132', N'Diferencia sueldo base')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H133', N'Monto Renta Accesoria ')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H134', N'Renta Imp Empreador Seg Ces Rta Accesori')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H135', N'Base Imp Trab Seg Ces Rta Accesoria')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'H136', N'Ulima base imponible licencia')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P001', N'Días Falta ')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P002', N'Días de Licencia')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P003', N'Días Trabajador')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P004', N'Gratificación Tope')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P005', N'25% del Sueldo')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P006', N'Número de Horas Extras')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P007', N'Tramo Asignación Familiar (A,B,C,D)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P008', N'Valor Asignación Familiar ')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P009', N'Valor de Movilización')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P010', N'Valor de Colación')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P011', N'Seguro Cesantía Empleador')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P012', N'Tiene seguro de Cesantia (Si=0 No=1)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P013', N'Tipo de Contrato (0= Indefinido 1=Fijo)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P014', N'Tope Salud')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P015', N'Salud para Impuestos')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P016', N'Dcto Afp,Salud y SegCes con tope 4.2 uf')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P017', N'Tope Seguro de Cesantía')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P018', N'Total Haberes Imponibles')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P019', N'Dias por Cuenta Licencia')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P020', N'Honorario Bruto')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P021', N'Código del Movimiento')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P022', N'Fecha Inicio AFP')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P023', N'Fecha Término AFP')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P024', N'Rut Pagadora Subsidio')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P025', N'Código de Afp Seguro Cesantía')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P026', N'Imponible sin Gratificación')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P027', N'Dcto Afp, Isapre, Seg.Ces. sin Tope')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P028', N'Total Otros Descuentos')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P029', N'Haber Imponible último mes trabajado all')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P030', N'Haber Imponible Seguro de cesantía')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P031', N'Remun. Imponible (Cta.Indemnizacion)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P032', N'Tasa Pactada (Cta. Indemnizacion)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P033', N'Num. Periodos Anteriores (Cta.Indemniz)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P034', N'Periodo Desde Anterior (Cta. Indemniz)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P035', N'Periodo Hasta Anterior (Cta.Indemniz)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P036', N'Inst. Autorizada (Trabajador Inp)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P037', N'Deposito Convenido')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P038', N'Cotizac. Voluntaria (Trabajador Inp)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P039', N'Monto Ahorro APV (Afp)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P040', N'Apv $ (Distinta Afp)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P041', N'Nombre Inst.APV')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P042', N'UF Pactada Apv (Distinta Afp)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P043', N'Apv UF (Distinta Afp)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P044', N'Apv Pactado % (Distinta Afp)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P045', N'Apv % (Distinta Afp)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P046', N'Total Apv (Distinto Afp)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P047', N'Funcionario Extranjero SI=1 NO=0')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P048', N'Trabajador INP 1=SI 0=NO')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P049', N'Dias Trabajdos')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P050', N'Trabajador Exento de cotizar SIS en AFP')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P051', N'Empleador asume costo SIS a la AFP')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P052', N'AFP Monto cotizacion SIS Empleador')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P053', N'AFP Monto cotizacion SIS Trabajador')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P054', N'AFP Monto Cotizacion Comision')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P055', N'Ultima Base imponible c/tope 60 UF')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P056', N'Codigo APV Otras Instituciones')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P057', N'Dias No Contratados')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P058', N'Mayor Retencion')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P059', N'A.F.P.')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P060', N'Codigo Banco')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P061', N'Contrato Adicional ')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P062', N'Centro Costo (PREVIRED)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P063', N'Mutual (ACHS)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P064', N'Imponible SC Empleador (PREVIRED)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P065', N'Tipo de Trabajados (PREVIRED)')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P066', N'DIAS PARA PROV. DE VACACIONES')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P067', N'Código AFC para trabajadores INP')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P070', N'% Trab. Seg Cesantia')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P071', N'% Aporte Empleador Seg Cesantia')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P072', N'SEGURO AL EMPLEO JOVEN ')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P073', N'cod seg corp vida')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P074', N'UF SEG CORPVIDA')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P075', N'Dias por cuenta empleado')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P076', N'APV UF A')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P077', N'COD APV A')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P078', N'APV PESOS A')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P079', N'APV 2 PESOS A')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P080', N'COD APV2 A')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P081', N'APV2 UF A')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P082', N'Nombre Inst. APV2')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P083', N'Jornada Laboral')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P084', N'Código cuenta 2 AFP Habitat')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P085', N'Honorario Bruto Isla de Pascua')
INSERT [dbo].[DS_Variables] ([codVariable], [descripcion]) VALUES (N'P086', N'Cotizacion Accidente trabajo')
GO
INSERT [dbo].[DS_Variables_Reporte] ([codVariable], [descripcion]) VALUES (N'H001', N'Sueldo Base')
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id_Menu], [Clase], [PieMenu], [Titulo], [Action], [Controler], [Id_Perfil], [Activo], [Orden], [IdEmpresa]) VALUES (1, N'fa fa-home', N'Reporte', N'Informacion de ventas', N'InformacionVentas', N'InformeVentas', 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
/****** Object:  StoredProcedure [dbo].[DS_DEL_VariablesReporte]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_DEL_VariablesReporte]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[DS_DEL_VariablesReporte]
@codVariable AS varchar(100)
AS 
BEGIN
	DELETE FROM [DS_Variables_Reporte] where codVariable = @codVariable		
END  
GO
/****** Object:  StoredProcedure [dbo].[DS_GET_ExcelNotasDeVenta]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_ExcelNotasDeVenta]								*/
/*-- Detalle			:														*/
/*-- Autor				: SIABA												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROC [dbo].[DS_GET_ExcelNotasDeVenta]
@pv_BaseDatos AS varchar(100),
@nvestado varchar (1),
@fechaDesde varchar(10),
@fechaHasta varchar(10)
AS
DECLARE @query AS nvarchar(max)
SELECT @query = ''

SELECT @query = @query + '
	SELECT DISTINCT 			
					nv.CodAux as CodigoCliente
				,	nv.NomCon as NombreCliente
				,	nv.NVNumero as NotaDeVenta
				,	pro.DesProd as Producto
				,	det.nvCant as Cantidad
				,	nv.nvSubTotal as ValorNV
				,	convert(varchar,nv.nvFem,105) AS FechaEmision
				,	convert(varchar,nvFecCompr,105) as FechaDespacho
				,	convert(varchar,nvFeEnt,105) as FechaEntrega 
				FROM [' + @pv_BaseDatos + '].softland.nw_nventa nv
					LEFT JOIN [' + @pv_BaseDatos + '].softland.cwtvend ven
						ON nv.VenCod= ven.VenCod
					LEFT JOIN [' + @pv_BaseDatos + '].softland.nw_detnv det
						ON nv.NVNumero = det.NVNumero
					LEFT JOIN [' + @pv_BaseDatos + '].softland.iw_tprod pro
						ON det.CodProd = pro.CodProd
					WHERE 
						nvEstado='''+@nvestado+''' 
						AND nvFem BETWEEN convert(datetime,''' + @fechaDesde + ''' + '' 00:00:00'',120) AND convert(datetime,''' + @fechaHasta + ''' + '' 00:00:00'',120)
					ORDER BY
						nv.NVNumero desc
'
EXEC (@query)
GO
/****** Object:  StoredProcedure [dbo].[DS_GET_Fichas]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_Fichas]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROC [dbo].[DS_GET_Fichas]
@pv_BaseDatos AS varchar(100),
@estado AS varchar(2),
@estadoAnterior AS varchar(2),
@mes AS varchar(2),
@mesAnterior AS varchar(2),
@ano AS varchar(4)
AS
DECLARE @query AS nvarchar(max)
SELECT @query = ''

SELECT @query = @query + '
	SELECT DISTINCT per.ficha AS NumFicha
			, per.nombres AS Nombre
			, per.rut AS RUT
			, ISNULL((select top 1 nombre 
				from [' + @pv_BaseDatos + '].softland.sw_afpper afper 
				join [' + @pv_BaseDatos + '].softland.sw_afp afp
				on afper.codAFP = afp.CodAFP
				where ficha = per.ficha and afper.vigDesde<='''+@ano+'-'+@mes+'-01'' and afper.vighasta>'''+@ano+'-'+@mes+'-01''),''SIN AFP'') AS AFP
            , ISNULL((select top 1 nombre 
				from [' + @pv_BaseDatos + '].softland.sw_afpper afper 
				join [' + @pv_BaseDatos + '].softland.sw_afp afp
				on afper.codAFP = afp.CodAFP
				where ficha = per.ficha and afper.vigHasta='''+@ano+'-'+@mes+'-01''),''-'') AS AFPAnterior
			, ISNULL((select top 1 nombre 
				from [' + @pv_BaseDatos + '].softland.sw_isapreper ipr
				join [' + @pv_BaseDatos + '].softland.sw_isapre i
				on ipr.codisapre = i.codisapre
				where ficha = per.ficha and ipr.vigDesde<='''+@ano+'-'+@mes+'-01'' and ipr.vighasta>'''+@ano+'-'+@mes+'-01''),''FONASA'') AS ISAPRE
			, ISNULL((select top 1 nombre 
				from [' + @pv_BaseDatos + '].softland.sw_isapreper ipr
				join [' + @pv_BaseDatos + '].softland.sw_isapre i
				on ipr.codisapre = i.codisapre
				where ficha = per.ficha and ipr.vighasta='''+@ano+'-'+@mes+'-01''),''-'') AS ISAPREAnterior	
			, CONCAT(((select campo'+@estado+' from [' + @pv_BaseDatos + '].softland.sw_afpper1 where ficha =per.ficha) + (select campo'+@estado+' from [' + @pv_BaseDatos + '].softland.sw_afpper2 where ficha =per.ficha) -(select valor from [' + @pv_BaseDatos + '].softland.sw_constvalor where codConst = ''cs00'' and mes='+@mes+')),''%'')  as ''PorcentajeAFP''
			, CONCAT(((select campo'+@estadoAnterior+' from [' + @pv_BaseDatos + '].softland.sw_afpper1 where ficha =per.ficha) + (select campo'+@estadoAnterior+' from [' + @pv_BaseDatos + '].softland.sw_afpper2 where ficha =per.ficha) -(select valor from [' + @pv_BaseDatos + '].softland.sw_constvalor where codConst = ''cs00'' and mes='+@mesAnterior+')),''%'')  as ''PorcentajeAFPAnterior''
			,CONCAT(ROUND(((select campo'+@estado+' from [' + @pv_BaseDatos + '].softland.sw_afpper1 where ficha =per.ficha) + (select campo'+@estado+' from [' + @pv_BaseDatos + '].softland.sw_afpper2 where ficha =per.ficha) -(select valor from [' + @pv_BaseDatos + '].softland.sw_constvalor where codConst = ''cs00'' and mes='+@mes+')),2)
			- ROUND(((select campo'+@estadoAnterior+' from [' + @pv_BaseDatos + '].softland.sw_afpper1 where ficha =per.ficha) + (select campo'+@estadoAnterior+' from [' + @pv_BaseDatos + '].softland.sw_afpper2 where ficha =per.ficha) -(select valor from [' + @pv_BaseDatos + '].softland.sw_constvalor where codConst = ''cs00'' and mes='+@mesAnterior+')),2),''%'')  as ''VariacionPorcentajeAFP''
			, CONCAT(''$'',CONCAT((select campo'+@estado+' from [' + @pv_BaseDatos + '].softland.sw_isaper5 where ficha = per.ficha),''UF'')) as ''PactadoIsapre''
			, CONCAT(''$'',CONCAT((select campo'+@estadoAnterior+' from [' + @pv_BaseDatos + '].softland.sw_isaper5 where ficha = per.ficha),''UF'')) as ''PactadoIsapreAnterior''
			, CONCAT(''$'',CONCAT((select campo'+@estado+' from [' + @pv_BaseDatos + '].softland.sw_isaper5 where ficha = per.ficha)-(select campo'+@estadoAnterior+' from [' + @pv_BaseDatos + '].softland.sw_isaper5 where ficha = per.ficha),''UF'')) as ''VariacionPactadoIsapre''
	FROM [' + @pv_BaseDatos + '].softland.sw_personal per
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_afpper afper 
	ON per.ficha = afper.ficha
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_afp afp
	ON afper.codAFP = afp.CodAFP
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_estadoper est
	ON per.ficha = est.ficha
	WHERE per.fechaFiniquito>'''+@ano+'-'+@mes+'-01''--mes
	AND est.estado'+@estado+'=''V''	--mes
	ORDER BY per.nombres
'
EXEC (@query)
GO
/****** Object:  StoredProcedure [dbo].[DS_GET_FichasOLD]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_Fichas]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROC [dbo].[DS_GET_FichasOLD]
@pv_BaseDatos AS varchar(100),
@estado AS varchar(2),
@mes AS varchar(2),
@ano AS varchar(4)
AS
DECLARE @query AS nvarchar(max)
SELECT @query = ''

SELECT @query = @query + '
	SELECT DISTINCT per.ficha AS NumFicha
			, per.nombres AS Nombre
			, per.rut AS RUT
			, ISNULL((select top 1 nombre 
				from [' + @pv_BaseDatos + '].softland.sw_afpper afper 
				join [' + @pv_BaseDatos + '].softland.sw_afp afp
				on afper.codAFP = afp.CodAFP
				where ficha = per.ficha and afper.vighasta>=''9999-01-01''),''SIN AFP'') AS AFP
			, ISNULL((select top 1 nombre 
				from [' + @pv_BaseDatos + '].softland.sw_isapreper ipr
				join [' + @pv_BaseDatos + '].softland.sw_isapre i
				on ipr.codisapre = i.codisapre
				where ficha = per.ficha),''FONASA'') AS ISAPRE	
			, CONCAT(((select campo'+@estado+' from [' + @pv_BaseDatos + '].softland.sw_afpper1 where ficha =per.ficha) + (select campo'+@estado+' from [' + @pv_BaseDatos + '].softland.sw_afpper2 where ficha =per.ficha) -(select valor from [' + @pv_BaseDatos + '].softland.sw_constvalor where codConst = ''cs00'' and mes='+@mes+')),''%'')  as ''PorcentajeAFP''
			, CONCAT(''$'',CONCAT((select campo'+@estado+' from [' + @pv_BaseDatos + '].softland.sw_isaper5 where ficha = per.ficha),''UF'')) as ''PactadoIsapre''
	FROM [' + @pv_BaseDatos + '].softland.sw_personal per
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_afpper afper 
	ON per.ficha = afper.ficha
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_afp afp
	ON afper.codAFP = afp.CodAFP
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_estadoper est
	ON per.ficha = est.ficha
	WHERE per.fechaFiniquito>='''+@ano+'-'+@mes+'-01''--mes
	AND est.estado'+@estado+'=''V''	--mes
	ORDER BY per.nombres
'
EXEC (@query)
GO
/****** Object:  StoredProcedure [dbo].[DS_GET_FichasOLD2]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_Fichas]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROC [dbo].[DS_GET_FichasOLD2]
@pv_BaseDatos AS varchar(100),
@estado AS varchar(2),
@mes AS varchar(2),
@ano AS varchar(4)
AS
DECLARE @query AS nvarchar(max)
SELECT @query = ''

SELECT @query = @query + '
	SELECT DISTINCT per.ficha AS NumFicha
			, per.nombres AS Nombre
			, per.rut AS RUT
			, ISNULL((select top 1 nombre 
				from [' + @pv_BaseDatos + '].softland.sw_afpper afper 
				join [' + @pv_BaseDatos + '].softland.sw_afp afp
				on afper.codAFP = afp.CodAFP
				where ficha = per.ficha and afper.vighasta>=''9999-01-01''),''SIN AFP'') AS AFP
			, ISNULL((select top 1 nombre 
				from [' + @pv_BaseDatos + '].softland.sw_isapreper ipr
				join [' + @pv_BaseDatos + '].softland.sw_isapre i
				on ipr.codisapre = i.codisapre
				where ficha = per.ficha),''FONASA'') AS ISAPRE		
	FROM [' + @pv_BaseDatos + '].softland.sw_personal per
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_afpper afper 
	ON per.ficha = afper.ficha
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_afp afp
	ON afper.codAFP = afp.CodAFP
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_estadoper est
	ON per.ficha = est.ficha
	WHERE per.fechaFiniquito>='''+@ano+'-'+@mes+'-01''--mes
	AND est.estado'+@estado+'=''V''	--mes
	ORDER BY per.nombres
'
EXEC (@query)
GO
/****** Object:  StoredProcedure [dbo].[DS_GET_Periodo]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_Periodo]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[DS_GET_Periodo]
AS 
BEGIN
	SELECT
			* 
			FROM [DS_Periodo]					
END  
GO
/****** Object:  StoredProcedure [dbo].[DS_GET_Valores]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_Valores]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[DS_GET_Valores]
@pv_BaseDatos AS varchar(100),
@ficha AS varchar (max),
@codVariable AS varchar(4),
@mes AS varchar(2),
@mesAnterior as varchar(2)
AS
DECLARE @query AS nvarchar(max)
SELECT @query = ''

SELECT @query = @query + '
		SELECT DISTINCT p.ficha as NumFicha,ISNULL((select top 1 valor FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona v where v.ficha = vp.ficha and v.codVariable='''+@codVariable+'''  and v.mes = '''+@mes+'''),''0'') as valor, ISNULL((select top 1 valor FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona v where v.ficha = vp.ficha and v.codVariable='''+@codVariable+'''  and v.mes = '''+@mesAnterior+'''),''0'') as valorAnterior  
		FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona vp
		LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_personal p
		ON vp.ficha = p.ficha
		where vp.ficha in ('+@ficha+') and codVariable='''+@codVariable+'''  and mes in('''+@mes+''','''+@mesAnterior+''')
		--ORDER BY p.nombres
			
'
EXEC (@query)


GO
/****** Object:  StoredProcedure [dbo].[DS_GET_ValoresOLD]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_Valores]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[DS_GET_ValoresOLD]
@pv_BaseDatos AS varchar(100),
@ficha AS varchar (max),
@codVariable AS varchar(4),
@mes AS varchar(2),
@mesAnterior as varchar(2)
AS
DECLARE @query AS nvarchar(max)
SELECT @query = ''

SELECT @query = @query + '
	IF EXISTS 
		(
		SELECT p.ficha as NumFicha,ISNULL(valor,''0'') as valor, ISNULL((select top 1 valor FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona v where v.ficha = vp.ficha and v.codVariable='''+@codVariable+'''  and v.mes = '''+@mesAnterior+'''),''0'') as valorAnterior  
		FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona vp
		LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_personal p
		ON vp.ficha = p.ficha
		where vp.ficha in ('+@ficha+') and codVariable='''+@codVariable+'''  and mes = '''+@mes+'''
		--ORDER BY p.nombres
		) 
	BEGIN
		SELECT p.ficha as NumFicha,ISNULL(valor,''0'') as valor, ISNULL((select top 1 valor FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona v where v.ficha = vp.ficha and v.codVariable='''+@codVariable+'''  and v.mes = '''+@mesAnterior+'''),''0'') as valorAnterior  
		FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona vp
		LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_personal p
		ON vp.ficha = p.ficha
		where vp.ficha in ('+@ficha+') and codVariable='''+@codVariable+'''  and mes = '''+@mes+'''
		ORDER BY p.nombres
	END
	ELSE
	BEGIN
		SELECT p.ficha as NumFicha, ''0'' valor, ISNULL((select top 1 valor FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona v where v.ficha = vp.ficha and v.codVariable='''+@codVariable+'''  and v.mes = '''+@mesAnterior+'''),''0'') as valorAnterior  
		FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona vp
		LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_personal p
		ON vp.ficha = p.ficha
		where vp.ficha in ('+@ficha+') and codVariable='''+@codVariable+'''  and mes = '''+@mesAnterior+'''
		ORDER BY p.nombres
	END	
'
EXEC (@query)


GO
/****** Object:  StoredProcedure [dbo].[DS_GET_ValoresOLD2]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_Valores]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[DS_GET_ValoresOLD2]
@pv_BaseDatos AS varchar(100),
@ficha AS varchar (max),
@codVariable AS varchar(4),
@mes AS varchar(2),
@mesAnterior as varchar(2)
AS
DECLARE @query AS nvarchar(max)
SELECT @query = ''

SELECT @query = @query + '
	SELECT p.ficha as NumFicha,ISNULL(valor,''0'') as valor, ISNULL((select top 1 valor FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona v where v.ficha = vp.ficha and v.codVariable='''+@codVariable+'''  and v.mes = '''+@mesAnterior+'''),''0'') as valorAnterior  
	FROM [' + @pv_BaseDatos + '].softland.sw_variablepersona vp
	LEFT JOIN [' + @pv_BaseDatos + '].softland.sw_personal p
	ON vp.ficha = p.ficha
	where vp.ficha in ('+@ficha+') and codVariable='''+@codVariable+'''  and mes = '''+@mes+'''
	ORDER BY p.nombres
	
'
EXEC (@query)


GO
/****** Object:  StoredProcedure [dbo].[DS_GET_Variables]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_Variables]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[DS_GET_Variables]
AS 
BEGIN
	SELECT
			* 
			FROM [DS_Variables] v
			WHERE v.codVariable NOT IN (SELECT codVariable FROM DS_variables_reporte r WHERE v.codVariable=r.codVariable)
			order by codVariable
END  
GO
/****** Object:  StoredProcedure [dbo].[DS_GET_VariablesReporte]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_GET_VariablesReporte]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[DS_GET_VariablesReporte]
AS 
BEGIN
	SELECT
			* 
			FROM [DS_Variables_Reporte] order by codVariable 			
END  
GO
/****** Object:  StoredProcedure [dbo].[DS_INS_VariablesReporte]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_INS_VariablesReporte]								*/
/*-- Detalle			:														*/
/*-- Autor				: WASAP												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[DS_INS_VariablesReporte]
@codVariable AS varchar(100),
@descripcion AS varchar(100)
AS 
BEGIN
	INSERT INTO DS_Variables_Reporte (codVariable,descripcion) VALUES (@codVariable, @descripcion)		
END  
GO
/****** Object:  StoredProcedure [dbo].[DS_ListaUsuarioEmpresa]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[DS_ListaUsuarioEmpresa]								*/
/*-- Detalle			:														*/
/*-- Autor				: FDURAN												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[DS_ListaUsuarioEmpresa]
(
	@pi_IdUsuario INT
)
AS  
BEGIN
	SELECT	IdUsuario = a.IdUsuario
	,		IdEmpresa = a.IdEmpresa
	,		NombreEmpresa = b.Nombre
	,		BaseDatos = b.BaseDatos
	FROM	DS_UsuarioEmpresa a
		INNER JOIN DS_Empresa b
			on a.IdEmpresa = b.Id
			JOIN dbo.DS_Usuarios du ON a.IdUsuario = du.Id
	WHERE	a.IdUsuario = @pi_IdUsuario
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_EmpresasUsuario]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Empresa			: DISOFI												*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[uSP_GET_EmpresasUsuario]								*/
/*-- Detalle			:														*/
/*-- Autor				: FDURAN												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
create procedure [dbo].[SP_GET_EmpresasUsuario]  
	@pi_IdUsuario int
as 
begin
	set nocount on 

	DECLARE	@query nvarchar(max)
	
	select	@query = ''
	
	select	@query = @query + '
	SELECT	TOP 1 
			IdUsuario = ' + convert(varchar(30), @pi_IdUsuario) + '
	,		IdEmpresa = a.IdEmpresa
	,		NombreEmpresa = b.Nombre
	,		BaseDatos = b.BaseDatos
	from	DS_UsuarioEmpresa a
		inner join DS_Empresa b
			on a.IdEmpresa = b.Id
	WHERE	a.IdUsuario = ' + convert(varchar(30), @pi_IdUsuario) + '
	'

	exec sp_executesql @query
	
	set nocount OFF
end  

GO
/****** Object:  StoredProcedure [dbo].[SP_GET_Menu]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[SP_GET_Menu]								*/
/*-- Detalle			:														*/
/*-- Autor				: FDURAN												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_GET_Menu]
@IdPerfil INT
as  
SELECT m.Id_Menu,m.Clase,m.PieMenu,m.Titulo,m.[Action],m.Controler
from Menu m 
where m.Id_Perfil = @IdPerfil and m.Activo = 1 order by m.Orden 

GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 22-12-2020 17:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------------------------------*/
/*-- Tipo				: Procedimiento											*/
/*-- Nombre				: [dbo].[SP_Login]								*/
/*-- Detalle			:														*/
/*-- Autor				: FDURAN												*/
/*-- Modificaciones		:														*/
/*------------------------------------------------------------------------------*/
CREATE procedure [dbo].[SP_Login]  
	@pv_Usuario varchar(100)
,	@pv_Contrasena varchar(100)
,	@pv_ContrasenaMD5 varchar(100)
as 
begin
	set nocount on       
	DECLARE	@query nvarchar(max)
	
	select	@query = ''
	begin try
		select	@query = @query + '
		SELECT	TOP 1 
				Id = usr.Id
		,		CodigoUsuario = usr.CodigoUsuario
		,		NombreUsuario = usr.NombreUsuario
		,		Nombres = usr.NombreCompleto
		,		tipoUsuario = tipo.Nombre
		,		Email = usr.email
		,		IdTipo = usr.IdTipo
		,		UrlInicio = tipo.UrlInicio
		,		CentroCosto = usr.CentroCosto
		FROM	[DS_Usuarios] AS usr
			LEFT JOIN [DS_TipoUsuario] AS tipo ON usr.IdTipo=tipo.Id
		WHERE usr.NombreUsuario=''' + @pv_Usuario + ''' AND usr.Contrasena = ''' + @pv_ContrasenaMD5 + '''
		'

		exec( @query)
	end try
	begin catch
		print (error_message())
	end catch
	
	set nocount OFF       
end  

GO
USE [master]
GO
ALTER DATABASE [DSSTANTEC] SET  READ_WRITE 
GO
