USE [master]
GO
/****** Object:  Database [BaseDeDatosTec]    Script Date: 27/11/2019 09:28:03 ******/
CREATE DATABASE [BaseDeDatosTec]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseDeDatosTec', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaseDeDatosTec.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BaseDeDatosTec_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaseDeDatosTec_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BaseDeDatosTec] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseDeDatosTec].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseDeDatosTec] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseDeDatosTec] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseDeDatosTec] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BaseDeDatosTec] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseDeDatosTec] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BaseDeDatosTec] SET  MULTI_USER 
GO
ALTER DATABASE [BaseDeDatosTec] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseDeDatosTec] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseDeDatosTec] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseDeDatosTec] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BaseDeDatosTec] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BaseDeDatosTec] SET QUERY_STORE = OFF
GO
USE [BaseDeDatosTec]
GO
/****** Object:  Table [dbo].[academias]    Script Date: 27/11/2019 09:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[academias](
	[idAcademia] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAcademia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actividades]    Script Date: 27/11/2019 09:28:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividades](
	[idActividad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](150) NULL,
	[grupo] [char](10) NOT NULL,
	[tema] [tinyint] NOT NULL,
	[ponderacion] [tinyint] NOT NULL,
	[fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[alumnos]    Script Date: 27/11/2019 09:28:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alumnos](
	[matricula] [char](9) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idCarrera] [tinyint] NOT NULL,
	[tutor] [varchar](40) NOT NULL,
	[idEspecialidad] [tinyint] NOT NULL,
	[estatus] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calificaciones]    Script Date: 27/11/2019 09:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calificaciones](
	[idCalifiacion] [int] IDENTITY(1,1) NOT NULL,
	[grupo] [char](10) NOT NULL,
	[matricula] [char](9) NOT NULL,
	[tema] [tinyint] NOT NULL,
	[calificacion] [float] NOT NULL,
	[tipoEval] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCalifiacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calles]    Script Date: 27/11/2019 09:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calles](
	[idCalle] [int] IDENTITY(1,1) NOT NULL,
	[Localidad] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carreras]    Script Date: 27/11/2019 09:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carreras](
	[idCarrera] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[coordinador] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detActividades]    Script Date: 27/11/2019 09:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detActividades](
	[idDetAct] [int] IDENTITY(1,1) NOT NULL,
	[actividad] [int] NOT NULL,
	[matricula] [char](9) NOT NULL,
	[calificacion] [tinyint] NOT NULL,
	[fechaEntrega] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetAct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detGrupos]    Script Date: 27/11/2019 09:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detGrupos](
	[idDetGpo] [int] IDENTITY(1,1) NOT NULL,
	[cveGrupo] [char](10) NOT NULL,
	[matricula] [char](9) NOT NULL,
	[tipoCurso] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetGpo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 27/11/2019 09:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[idEmpleado] [smallint] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idEmpleo] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleos]    Script Date: 27/11/2019 09:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleos](
	[idEmpleo] [tinyint] IDENTITY(1,1) NOT NULL,
	[puesto] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialidades]    Script Date: 27/11/2019 09:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidades](
	[idEspecialidad] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[carrera] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 27/11/2019 09:28:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[idEstado] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupos]    Script Date: 27/11/2019 09:28:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupos](
	[cveGrupo] [char](10) NOT NULL,
	[materia] [char](8) NOT NULL,
	[profesor] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cveGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horarios]    Script Date: 27/11/2019 09:28:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horarios](
	[idHorario] [smallint] IDENTITY(1,1) NOT NULL,
	[grupo] [char](10) NOT NULL,
	[dia] [tinyint] NOT NULL,
	[hora] [tinyint] NOT NULL,
	[aula] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inasistencias]    Script Date: 27/11/2019 09:28:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inasistencias](
	[idInasistencia] [int] IDENTITY(1,1) NOT NULL,
	[grupo] [char](10) NOT NULL,
	[matricula] [char](9) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[tipoInasistencia] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idInasistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidades]    Script Date: 27/11/2019 09:28:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidades](
	[idLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[Municipio] [smallint] NOT NULL,
	[nombre] [varchar](40) NULL,
	[tipo] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materias]    Script Date: 27/11/2019 09:28:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materias](
	[cveMateria] [char](8) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[hTeoricas] [tinyint] NOT NULL,
	[hPracticas] [tinyint] NOT NULL,
	[creditos] [tinyint] NOT NULL,
	[carrera] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cveMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[municipios]    Script Date: 27/11/2019 09:28:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipios](
	[idMunicipio] [smallint] IDENTITY(1,1) NOT NULL,
	[numero] [tinyint] NOT NULL,
	[Estado] [tinyint] NOT NULL,
	[nombre] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas]    Script Date: 27/11/2019 09:28:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[paterno] [varchar](40) NOT NULL,
	[materno] [varchar](40) NULL,
	[nombres] [varchar](40) NOT NULL,
	[fecha_nac] [date] NOT NULL,
	[sexo] [bit] NOT NULL,
	[curp] [char](18) NOT NULL,
	[telefono] [char](10) NULL,
	[numExt] [varchar](5) NOT NULL,
	[numInt] [varchar](5) NULL,
	[cp] [char](5) NULL,
	[edoCivil] [tinyint] NOT NULL,
	[discapacidad] [tinyint] NOT NULL,
	[calle] [varchar](30) NULL,
	[localidades] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profesores]    Script Date: 27/11/2019 09:28:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesores](
	[idProfesor] [varchar](40) NOT NULL,
	[idEmpleado] [smallint] NOT NULL,
	[idAcademia] [tinyint] NOT NULL,
	[tipoMemb] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposLocalidad]    Script Date: 27/11/2019 09:28:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposLocalidad](
	[idTipoLoc] [tinyint] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoLoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios_Login]    Script Date: 27/11/2019 09:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios_Login](
	[usuario] [varchar](15) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[apellidos] [varchar](80) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[pass] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[academias] ON 

INSERT [dbo].[academias] ([idAcademia], [nombre]) VALUES (1, N'Ingenier�a en Sistemas Computacionales')
INSERT [dbo].[academias] ([idAcademia], [nombre]) VALUES (2, N'Ingenier�a en Innovaci�n Agr�cola Sustentable')
INSERT [dbo].[academias] ([idAcademia], [nombre]) VALUES (3, N'Ingenier�a en Gesti�n Empresarial')
INSERT [dbo].[academias] ([idAcademia], [nombre]) VALUES (4, N'Ingenier�a Industrial')
INSERT [dbo].[academias] ([idAcademia], [nombre]) VALUES (5, N'Ciencias B�sicas')
INSERT [dbo].[academias] ([idAcademia], [nombre]) VALUES (6, N'Lengua Extranjera')
SET IDENTITY_INSERT [dbo].[academias] OFF
SET IDENTITY_INSERT [dbo].[actividades] ON 

INSERT [dbo].[actividades] ([idActividad], [nombre], [descripcion], [grupo], [tema], [ponderacion], [fecha]) VALUES (1, N'Tarea1', N'Mapa', N'Grupo1    ', 1, 10, CAST(N'2019-10-27T23:46:42.723' AS DateTime))
INSERT [dbo].[actividades] ([idActividad], [nombre], [descripcion], [grupo], [tema], [ponderacion], [fecha]) VALUES (2, N'Examen chido', N'El examen esta bien chido', N'Grupo1    ', 1, 60, CAST(N'2019-11-01T15:53:47.133' AS DateTime))
SET IDENTITY_INSERT [dbo].[actividades] OFF
INSERT [dbo].[alumnos] ([matricula], [idPersona], [idCarrera], [tutor], [idEspecialidad], [estatus]) VALUES (N'1601F0040', 16, 1, N'RRangel', 1, 0)
INSERT [dbo].[alumnos] ([matricula], [idPersona], [idCarrera], [tutor], [idEspecialidad], [estatus]) VALUES (N'1601F0062', 20, 1, N'RRangel', 1, 0)
INSERT [dbo].[alumnos] ([matricula], [idPersona], [idCarrera], [tutor], [idEspecialidad], [estatus]) VALUES (N'1901F0000', 13, 1, N'RRangel', 1, 0)
SET IDENTITY_INSERT [dbo].[calificaciones] ON 

INSERT [dbo].[calificaciones] ([idCalifiacion], [grupo], [matricula], [tema], [calificacion], [tipoEval]) VALUES (1, N'Grupo1    ', N'1601F0040', 1, 100, N'1')
SET IDENTITY_INSERT [dbo].[calificaciones] OFF
SET IDENTITY_INSERT [dbo].[carreras] ON 

INSERT [dbo].[carreras] ([idCarrera], [nombre], [coordinador]) VALUES (1, N'Ingenier�a en Sistemas Computacionales', 4)
INSERT [dbo].[carreras] ([idCarrera], [nombre], [coordinador]) VALUES (3, N'Ingenieria en Gestion Empresarial', 12)
INSERT [dbo].[carreras] ([idCarrera], [nombre], [coordinador]) VALUES (4, N'Ingenieria en Innovacion Agricola y Sustentable', 13)
INSERT [dbo].[carreras] ([idCarrera], [nombre], [coordinador]) VALUES (5, N'Ingenieria Industrial', 15)
SET IDENTITY_INSERT [dbo].[carreras] OFF
SET IDENTITY_INSERT [dbo].[detActividades] ON 

INSERT [dbo].[detActividades] ([idDetAct], [actividad], [matricula], [calificacion], [fechaEntrega]) VALUES (1, 1, N'1601F0040', 100, CAST(N'2019-10-28T16:41:58.183' AS DateTime))
SET IDENTITY_INSERT [dbo].[detActividades] OFF
SET IDENTITY_INSERT [dbo].[detGrupos] ON 

INSERT [dbo].[detGrupos] ([idDetGpo], [cveGrupo], [matricula], [tipoCurso]) VALUES (1, N'Grupo1    ', N'1601F0040', N'CN')
SET IDENTITY_INSERT [dbo].[detGrupos] OFF
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (1, 2, 1)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (4, 11, 1)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (5, 14, 1)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (6, 15, 2)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (7, 16, 3)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (8, 21, 1)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (9, 22, 1)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (10, 23, 1)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (11, 24, 1)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (12, 25, 3)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (13, 26, 3)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (14, 28, 3)
INSERT [dbo].[empleados] ([idEmpleado], [idPersona], [idEmpleo]) VALUES (15, 29, 3)
SET IDENTITY_INSERT [dbo].[empleados] OFF
SET IDENTITY_INSERT [dbo].[empleos] ON 

INSERT [dbo].[empleos] ([idEmpleo], [puesto]) VALUES (1, N'Profesor')
INSERT [dbo].[empleos] ([idEmpleo], [puesto]) VALUES (2, N'Director')
INSERT [dbo].[empleos] ([idEmpleo], [puesto]) VALUES (3, N'Coordinador')
INSERT [dbo].[empleos] ([idEmpleo], [puesto]) VALUES (4, N'Jefe de Servicios Escolares')
INSERT [dbo].[empleos] ([idEmpleo], [puesto]) VALUES (5, N'Jefe de planeaci�n')
SET IDENTITY_INSERT [dbo].[empleos] OFF
SET IDENTITY_INSERT [dbo].[especialidades] ON 

INSERT [dbo].[especialidades] ([idEspecialidad], [nombre], [carrera]) VALUES (1, N'Base de datos', 1)
INSERT [dbo].[especialidades] ([idEspecialidad], [nombre], [carrera]) VALUES (2, N'Redes', 1)
INSERT [dbo].[especialidades] ([idEspecialidad], [nombre], [carrera]) VALUES (3, N'Gerencia de proyectos', 4)
INSERT [dbo].[especialidades] ([idEspecialidad], [nombre], [carrera]) VALUES (4, N'Procesos y gesti�n de calidad', 4)
INSERT [dbo].[especialidades] ([idEspecialidad], [nombre], [carrera]) VALUES (5, N'Planeaci�n y control de productividad', 4)
INSERT [dbo].[especialidades] ([idEspecialidad], [nombre], [carrera]) VALUES (6, N'Cultivos', 4)
INSERT [dbo].[especialidades] ([idEspecialidad], [nombre], [carrera]) VALUES (7, N'Plan de negocios', 3)
INSERT [dbo].[especialidades] ([idEspecialidad], [nombre], [carrera]) VALUES (8, N'Marketing', 3)
INSERT [dbo].[especialidades] ([idEspecialidad], [nombre], [carrera]) VALUES (9, N'Dise�o de planes de negocio', 3)
SET IDENTITY_INSERT [dbo].[especialidades] OFF
SET IDENTITY_INSERT [dbo].[estados] ON 

INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (1, N'Aguascalientes')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (2, N'Baja California')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (3, N'Baja California Sur')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (4, N'Campeche')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (5, N'Chiapas')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (6, N'Chihuahua')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (7, N'Coahuila de Zaragoza')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (8, N'Colima')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (9, N'Durango')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (10, N'Estado de M�xico')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (11, N'Guanajuato')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (12, N'Guerrero')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (13, N'Hidalgo')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (14, N'Jalisco')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (15, N'Michoac�n de Ocampo')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (16, N'Morelos')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (17, N'Nayarit')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (18, N'Nuevo Le�n')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (19, N'Oaxaca')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (20, N'Puebla')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (21, N'Quer�taro')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (22, N'Quintana Roo')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (23, N'San Luis Potos�')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (24, N'Sinaloa')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (25, N'Sonora')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (26, N'Tabasco')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (27, N'Tamaulipas')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (28, N'Tlaxcala')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (29, N'Veracruz')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (30, N'Yucat�n')
INSERT [dbo].[estados] ([idEstado], [nombre]) VALUES (31, N'Zacatecas')
SET IDENTITY_INSERT [dbo].[estados] OFF
INSERT [dbo].[grupos] ([cveGrupo], [materia], [profesor]) VALUES (N'Grupo1    ', N'MateDis ', N'RRangel')
INSERT [dbo].[grupos] ([cveGrupo], [materia], [profesor]) VALUES (N'Grupo2    ', N'EST-IN3 ', N'HHECTOR')
INSERT [dbo].[grupos] ([cveGrupo], [materia], [profesor]) VALUES (N'Grupo3    ', N'HYSI-2D ', N'EIDALID')
INSERT [dbo].[grupos] ([cveGrupo], [materia], [profesor]) VALUES (N'Grupo4    ', N'PS-IND72', N'IND')
INSERT [dbo].[grupos] ([cveGrupo], [materia], [profesor]) VALUES (N'Grupo5    ', N'TBD     ', N'RRangel')
SET IDENTITY_INSERT [dbo].[horarios] ON 

INSERT [dbo].[horarios] ([idHorario], [grupo], [dia], [hora], [aula]) VALUES (1, N'Grupo1    ', 0, 0, N'0')
SET IDENTITY_INSERT [dbo].[horarios] OFF
SET IDENTITY_INSERT [dbo].[inasistencias] ON 

INSERT [dbo].[inasistencias] ([idInasistencia], [grupo], [matricula], [fecha], [tipoInasistencia]) VALUES (1, N'Grupo1    ', N'1601F0040', CAST(N'2019-10-29T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[inasistencias] OFF
SET IDENTITY_INSERT [dbo].[localidades] ON 

INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (1, 21, N'16 de Septiembre', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (2, 21, N'18 de Febrero', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (3, 21, N'18 de Marzo', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (4, 21, N'1ro de Mayo', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (5, 21, N'20 de Noviembre', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (6, 21, N'20 de Septiembre', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (7, 21, N'5 de Mayo', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (8, 21, N'7 de Noviembre', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (9, 21, N'Aeropuerto', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (10, 21, N'Altavista', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (11, 21, N'�lvaro Obreg�n', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (12, 21, N'An�huac 1', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (13, 21, N'An�huac 2', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (14, 21, N'Andaluc�a', 4)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (15, 21, N'Aquiles Serd�n', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (16, 21, N'Aurora', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (17, 21, N'Ayuntamiento', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (18, 21, N'Azucarera', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (19, 21, N'Bellavista', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (20, 21, N'Benito Ju�rez', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (21, 21, N'Benito Ju�rez', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (22, 21, N'Bur�crata', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (23, 21, N'Campesina', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (24, 21, N'Campesina 2', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (25, 21, N'Campestre', 4)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (26, 21, N'Canoas', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (27, 21, N'Carlos M del Pino', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (28, 21, N'Carolina Yucat�n Dos', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (29, 21, N'Celaya', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (30, 21, N'Cerro del Bernal', 4)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (31, 21, N'Chapultepec', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (32, 21, N'Ciudad Mante Centro', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (33, 21, N'Country Club', 4)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (34, 21, N'Cuauht�moc', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (35, 21, N'Del Bosque', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (36, 21, N'Del M�sico', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (37, 21, N'Del Valle', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (38, 21, N'Divisi�n del Norte', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (39, 21, N'El Abra', 2)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (40, 21, N'El Camotero', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (41, 21, N'El Huastequillo', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (42, 21, N'El Lim�n', 5)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (43, 21, N'El Martillo', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (44, 21, N'El Ol�mpico', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (45, 21, N'El Refugio', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (46, 21, N'El Triunfo N�mero 1', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (47, 21, N'El Triunfo N�mero 2', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (48, 21, N'Emiliano Zapata', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (49, 21, N'Enrique C�rdenas Gonz�lez', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (50, 21, N'Esfuerzo Obrero', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (51, 21, N'Faja de Oro', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (52, 21, N'Faja de Oro', 4)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (53, 21, N'Felipe �ngeles', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (54, 21, N'Fomento Nacional', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (55, 21, N'FOVISSSTE 1', 7)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (56, 21, N'FOVISSSTE 2', 7)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (57, 21, N'Francisco I. Madero', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (58, 21, N'Francisco Villa', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (59, 21, N'Gerardo Ferrara', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (60, 21, N'Gonzalez Ortega', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (61, 21, N'Ignacio Allende', 3)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (62, 21, N'Ignacio de la Llave', 1)
INSERT [dbo].[localidades] ([idLocalidad], [Municipio], [nombre], [tipo]) VALUES (63, 21, N'Independencia', 1)
SET IDENTITY_INSERT [dbo].[localidades] OFF
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'CMM-0001', N'Mi materia fregona', 0, 7, 7, 1)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'ELEC-876', N'Electricidad', 50, 4, 4, 5)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'EST-IN3 ', N'Estadistica inferencial', 40, 5, 4, 3)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'FNT-5D  ', N'Fundamentos de gestion empresarial', 40, 5, 4, 3)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'HYSI-2D ', N'Higiene y seguridad industrial', 40, 5, 5, 5)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'ING-EC22', N'Ingenieria economica', 50, 5, 6, 5)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'MAC-83D ', N'Macroeconomia', 50, 5, 6, 3)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'MateDis ', N'Matematicas Discretas', 50, 25, 5, 1)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'PROLOG  ', N'Programacion logica y fucional', 5, 5, 5, 1)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'PS-IND72', N'Psicologia Industrial', 30, 5, 4, 5)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'TBD     ', N'Taller de base de datos', 50, 5, 5, 1)
INSERT [dbo].[materias] ([cveMateria], [nombre], [hTeoricas], [hPracticas], [creditos], [carrera]) VALUES (N'WEB-93  ', N'Programacion web', 50, 5, 5, 1)
SET IDENTITY_INSERT [dbo].[municipios] ON 

INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (1, 1, 27, N'Abasolo')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (2, 2, 27, N'Aldama')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (3, 3, 27, N'Altamira')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (4, 4, 27, N'Antiguo Morelos')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (5, 5, 27, N'Burgos')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (6, 6, 27, N'Bustamante')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (7, 7, 27, N'Camargo')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (8, 8, 27, N'Casas')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (9, 9, 27, N'Ciudad Madero')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (10, 10, 27, N'Cruillas')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (11, 11, 27, N'Gomez Far�as')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (12, 12, 27, N'Gonz�lez')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (13, 13, 27, N'G��mez')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (14, 14, 27, N'Guerrero')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (15, 15, 27, N'Gustavo D�az Ordaz')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (16, 16, 27, N'Hidalgo')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (17, 17, 27, N'Jaumave')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (18, 18, 27, N'Jim�nez')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (19, 19, 27, N'Llera')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (20, 20, 27, N'Mainero')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (21, 21, 27, N'El Mante')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (22, 22, 27, N'Matamoros')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (23, 23, 27, N'M�ndez')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (24, 24, 27, N'Mier')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (25, 25, 27, N'Miguel Alem�n')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (26, 26, 27, N'Miquihuana')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (27, 27, 27, N'Nuevo Laredo')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (28, 28, 27, N'Nuevo Morelos')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (29, 29, 27, N'Ocampo')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (30, 30, 27, N'Padilla')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (31, 31, 27, N'Palmillas')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (32, 32, 27, N'Reynosa')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (33, 33, 27, N'R�o Bravo')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (34, 34, 27, N'San Carlos')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (35, 35, 27, N'San Fernando')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (36, 36, 27, N'San Nicol�s')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (37, 37, 27, N'Soto la Marina')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (38, 38, 27, N'Tampico')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (39, 39, 27, N'Tula')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (40, 40, 27, N'Valle Hermoso')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (41, 41, 27, N'Victoria')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (42, 42, 27, N'Villagr�n')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (43, 43, 27, N'Xicot�ncatl')
INSERT [dbo].[municipios] ([idMunicipio], [numero], [Estado], [nombre]) VALUES (45, 1, 18, N'Abasolo')
SET IDENTITY_INSERT [dbo].[municipios] OFF
SET IDENTITY_INSERT [dbo].[personas] ON 

INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (1, N'Ibarra', N'P�rez', N'Andr�', CAST(N'1998-07-23' AS Date), 1, N'IAPA980723HTSBRN00', N'8311131562', N'1410', NULL, N'89888', 1, 0, N'Hidalgo', 63)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (2, N'Sobrevilla', N'Pintor', N'Veronica', CAST(N'1990-05-19' AS Date), 1, N'SOPV900519        ', N'8311148648', N'610', NULL, N'89800', 1, 0, N'Ocampo', 32)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (11, N'Rangel', N'Anguiano', N'Roberto', CAST(N'1990-05-01' AS Date), 1, N'RAAR              ', N'831       ', N'300', N'SN', N'89800', 1, 0, N'Ocampo', 32)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (12, N'Gonzalez', N'Martinez', N'Miguel Angel', CAST(N'1998-08-28' AS Date), 1, N'GOMM              ', N'831       ', N'300', N'SN', N'89860', 0, 0, N'SN', 49)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (13, N'Gonzalez', N'Martinez', N'Miguel Pedro', CAST(N'1998-08-28' AS Date), 0, N'GOMM              ', N'8319898767', N'300', N'SN', N'89860', 0, 0, N'SN', 48)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (14, N'IBARRA', N'PEREZ', N'ANDRE', CAST(N'2019-11-26' AS Date), 1, N'MMMMMMM           ', N'831416161 ', N'100', N'2', N'98989', 0, 0, N'INDEPE', 1)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (15, N'IBARRA', N'PEREZ', N'PEDRO', CAST(N'2019-11-26' AS Date), 1, N'MMMMMMM           ', N'8314161613', N'100', N'2', N'98989', 0, 0, N'INDEPE2', 1)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (16, N'Gonzalez', N'Martinez', N'Miguel Angel', CAST(N'1998-08-28' AS Date), 0, N'GOMM              ', N'8319898767', N'300', N'SN', N'89860', 0, 0, N'SN', 47)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (20, N'Salazar ', N'Sanchez', N'Alejandro Filiberto', CAST(N'2019-11-26' AS Date), 1, N'FILIEYTW6737ED    ', N'1234567899', N'655', N'7', N'89800', 0, 0, N'MIGUEL ALEMAN', 12)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (21, N'MU�OZ ', N'MEZA', N'CRISTIAN', CAST(N'2019-11-26' AS Date), 1, N'CRISTIAN8727      ', N'987654321 ', N'435', N'7', N'89800', 1, 0, N'RIO PANUCO', 13)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (22, N'PELAYO', N'MARQUEZ', N'ROSA ERNESTINA', CAST(N'2019-11-26' AS Date), 0, N'ROSITA56252V      ', N'987654321 ', N'435', N'3', N'89800', 0, 0, N'MORELOS', 17)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (23, N'IDALID', N'SANCHEZ', N'EVA', CAST(N'2019-11-26' AS Date), 0, N'EVITA6528YJ       ', N'9876543219', N'190', N'3', N'89880', 0, 0, N'TAMPICO', 24)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (24, N'RAMIREZ', N'JUAREZ', N'PAULINO', CAST(N'2019-11-26' AS Date), 1, N'PAU8638DUIE       ', N'9876543219', N'190', N'3', N'89880', 1, 0, N'HIDALGO', 27)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (25, N'WONG', N'WONG', N'LUIS', CAST(N'2019-11-26' AS Date), 1, N'WONGIERUI3847R    ', N'123456789 ', N'389', N'1', N'89800', 0, 0, N'JUAREZ', 17)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (26, N'SALATINO', N'SALATINO', N'JOSE', CAST(N'2019-11-26' AS Date), 1, N'WONGIERUI3847R    ', N'123456789 ', N'389', N'1', N'89800', 1, 0, N'PEDRO', 17)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (28, N'MTZ', N'MTZ', N'HECTOR', CAST(N'2019-11-26' AS Date), 1, N'HECTORIJSC7632    ', N'123456789 ', N'366', N'1', N'89800', 1, 0, N'PEDRO', 10)
INSERT [dbo].[personas] ([idPersona], [paterno], [materno], [nombres], [fecha_nac], [sexo], [curp], [telefono], [numExt], [numInt], [cp], [edoCivil], [discapacidad], [calle], [localidades]) VALUES (29, N'INDUSTRIAL', N'MTZ', N'CORDI', CAST(N'2019-11-26' AS Date), 1, N'INDAJDSKF3286     ', N'123456789 ', N'990', N'1', N'89800', 1, 0, N'PEDRO', 10)
SET IDENTITY_INSERT [dbo].[personas] OFF
INSERT [dbo].[profesores] ([idProfesor], [idEmpleado], [idAcademia], [tipoMemb]) VALUES (N'CMU�OZ', 8, 1, 3)
INSERT [dbo].[profesores] ([idProfesor], [idEmpleado], [idAcademia], [tipoMemb]) VALUES (N'EIDALID', 10, 3, 0)
INSERT [dbo].[profesores] ([idProfesor], [idEmpleado], [idAcademia], [tipoMemb]) VALUES (N'HHECTOR', 14, 1, 4)
INSERT [dbo].[profesores] ([idProfesor], [idEmpleado], [idAcademia], [tipoMemb]) VALUES (N'IND', 15, 4, 4)
INSERT [dbo].[profesores] ([idProfesor], [idEmpleado], [idAcademia], [tipoMemb]) VALUES (N'JSALATINO', 13, 2, 4)
INSERT [dbo].[profesores] ([idProfesor], [idEmpleado], [idAcademia], [tipoMemb]) VALUES (N'LWONG', 12, 3, 4)
INSERT [dbo].[profesores] ([idProfesor], [idEmpleado], [idAcademia], [tipoMemb]) VALUES (N'PRAMIREZ', 11, 1, 0)
INSERT [dbo].[profesores] ([idProfesor], [idEmpleado], [idAcademia], [tipoMemb]) VALUES (N'RPELAYO', 9, 1, 4)
INSERT [dbo].[profesores] ([idProfesor], [idEmpleado], [idAcademia], [tipoMemb]) VALUES (N'RRangel', 4, 1, 0)
SET IDENTITY_INSERT [dbo].[tiposLocalidad] ON 

INSERT [dbo].[tiposLocalidad] ([idTipoLoc], [tipo]) VALUES (1, N'Colonia')
INSERT [dbo].[tiposLocalidad] ([idTipoLoc], [tipo]) VALUES (2, N'Congregacion')
INSERT [dbo].[tiposLocalidad] ([idTipoLoc], [tipo]) VALUES (3, N'Ejido')
INSERT [dbo].[tiposLocalidad] ([idTipoLoc], [tipo]) VALUES (4, N'Fraccionamiento')
INSERT [dbo].[tiposLocalidad] ([idTipoLoc], [tipo]) VALUES (5, N'Pueblo')
INSERT [dbo].[tiposLocalidad] ([idTipoLoc], [tipo]) VALUES (6, N'Rancher�a')
INSERT [dbo].[tiposLocalidad] ([idTipoLoc], [tipo]) VALUES (7, N'Unidad Habitacional')
INSERT [dbo].[tiposLocalidad] ([idTipoLoc], [tipo]) VALUES (8, N'Zona Industrial')
SET IDENTITY_INSERT [dbo].[tiposLocalidad] OFF
INSERT [dbo].[usuarios_Login] ([usuario], [nombre], [apellidos], [email], [pass]) VALUES (N'Admin', N'Admin', N'', N'sk8muski@gmail.com', N'3qi2qtccj')
INSERT [dbo].[usuarios_Login] ([usuario], [nombre], [apellidos], [email], [pass]) VALUES (N'muski', N'Andre', N'Ibarra Perez', N'sk8muski@gmail.com', N'3qi2qtccj')
ALTER TABLE [dbo].[actividades]  WITH CHECK ADD  CONSTRAINT [fk_grupo_actividad] FOREIGN KEY([grupo])
REFERENCES [dbo].[grupos] ([cveGrupo])
GO
ALTER TABLE [dbo].[actividades] CHECK CONSTRAINT [fk_grupo_actividad]
GO
ALTER TABLE [dbo].[alumnos]  WITH CHECK ADD  CONSTRAINT [fk_carrera_alumno] FOREIGN KEY([idCarrera])
REFERENCES [dbo].[carreras] ([idCarrera])
GO
ALTER TABLE [dbo].[alumnos] CHECK CONSTRAINT [fk_carrera_alumno]
GO
ALTER TABLE [dbo].[alumnos]  WITH CHECK ADD  CONSTRAINT [fk_especialidad_alumno] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[especialidades] ([idEspecialidad])
GO
ALTER TABLE [dbo].[alumnos] CHECK CONSTRAINT [fk_especialidad_alumno]
GO
ALTER TABLE [dbo].[alumnos]  WITH CHECK ADD  CONSTRAINT [fk_persona_alumno] FOREIGN KEY([idPersona])
REFERENCES [dbo].[personas] ([idPersona])
GO
ALTER TABLE [dbo].[alumnos] CHECK CONSTRAINT [fk_persona_alumno]
GO
ALTER TABLE [dbo].[alumnos]  WITH CHECK ADD  CONSTRAINT [fk_tutor_alumno] FOREIGN KEY([tutor])
REFERENCES [dbo].[profesores] ([idProfesor])
GO
ALTER TABLE [dbo].[alumnos] CHECK CONSTRAINT [fk_tutor_alumno]
GO
ALTER TABLE [dbo].[calificaciones]  WITH CHECK ADD  CONSTRAINT [fk_grupo_calificacion] FOREIGN KEY([grupo])
REFERENCES [dbo].[grupos] ([cveGrupo])
GO
ALTER TABLE [dbo].[calificaciones] CHECK CONSTRAINT [fk_grupo_calificacion]
GO
ALTER TABLE [dbo].[calificaciones]  WITH CHECK ADD  CONSTRAINT [fk_matriucla_calificacion] FOREIGN KEY([matricula])
REFERENCES [dbo].[alumnos] ([matricula])
GO
ALTER TABLE [dbo].[calificaciones] CHECK CONSTRAINT [fk_matriucla_calificacion]
GO
ALTER TABLE [dbo].[calles]  WITH CHECK ADD  CONSTRAINT [fk_localidad] FOREIGN KEY([Localidad])
REFERENCES [dbo].[localidades] ([idLocalidad])
GO
ALTER TABLE [dbo].[calles] CHECK CONSTRAINT [fk_localidad]
GO
ALTER TABLE [dbo].[carreras]  WITH CHECK ADD  CONSTRAINT [fk_coordinador] FOREIGN KEY([coordinador])
REFERENCES [dbo].[empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[carreras] CHECK CONSTRAINT [fk_coordinador]
GO
ALTER TABLE [dbo].[detActividades]  WITH CHECK ADD  CONSTRAINT [fk_actividad_detact] FOREIGN KEY([actividad])
REFERENCES [dbo].[actividades] ([idActividad])
GO
ALTER TABLE [dbo].[detActividades] CHECK CONSTRAINT [fk_actividad_detact]
GO
ALTER TABLE [dbo].[detActividades]  WITH CHECK ADD  CONSTRAINT [fk_matricula_detact] FOREIGN KEY([matricula])
REFERENCES [dbo].[alumnos] ([matricula])
GO
ALTER TABLE [dbo].[detActividades] CHECK CONSTRAINT [fk_matricula_detact]
GO
ALTER TABLE [dbo].[detGrupos]  WITH CHECK ADD  CONSTRAINT [fk_grupo_detgpo] FOREIGN KEY([cveGrupo])
REFERENCES [dbo].[grupos] ([cveGrupo])
GO
ALTER TABLE [dbo].[detGrupos] CHECK CONSTRAINT [fk_grupo_detgpo]
GO
ALTER TABLE [dbo].[detGrupos]  WITH CHECK ADD  CONSTRAINT [fk_matricula_detgpo] FOREIGN KEY([matricula])
REFERENCES [dbo].[alumnos] ([matricula])
GO
ALTER TABLE [dbo].[detGrupos] CHECK CONSTRAINT [fk_matricula_detgpo]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [fk_empleo] FOREIGN KEY([idEmpleo])
REFERENCES [dbo].[empleos] ([idEmpleo])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [fk_empleo]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [fk_persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[personas] ([idPersona])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [fk_persona]
GO
ALTER TABLE [dbo].[especialidades]  WITH CHECK ADD  CONSTRAINT [fk_carrera] FOREIGN KEY([carrera])
REFERENCES [dbo].[carreras] ([idCarrera])
GO
ALTER TABLE [dbo].[especialidades] CHECK CONSTRAINT [fk_carrera]
GO
ALTER TABLE [dbo].[grupos]  WITH CHECK ADD  CONSTRAINT [fk_materia_grupo] FOREIGN KEY([materia])
REFERENCES [dbo].[materias] ([cveMateria])
GO
ALTER TABLE [dbo].[grupos] CHECK CONSTRAINT [fk_materia_grupo]
GO
ALTER TABLE [dbo].[grupos]  WITH CHECK ADD  CONSTRAINT [fk_profesor_grupo] FOREIGN KEY([profesor])
REFERENCES [dbo].[profesores] ([idProfesor])
GO
ALTER TABLE [dbo].[grupos] CHECK CONSTRAINT [fk_profesor_grupo]
GO
ALTER TABLE [dbo].[horarios]  WITH CHECK ADD  CONSTRAINT [fk_grupo_horario] FOREIGN KEY([grupo])
REFERENCES [dbo].[grupos] ([cveGrupo])
GO
ALTER TABLE [dbo].[horarios] CHECK CONSTRAINT [fk_grupo_horario]
GO
ALTER TABLE [dbo].[inasistencias]  WITH CHECK ADD  CONSTRAINT [fk_grupo_inasistencia] FOREIGN KEY([grupo])
REFERENCES [dbo].[grupos] ([cveGrupo])
GO
ALTER TABLE [dbo].[inasistencias] CHECK CONSTRAINT [fk_grupo_inasistencia]
GO
ALTER TABLE [dbo].[inasistencias]  WITH CHECK ADD  CONSTRAINT [fk_matricula_inasistencia] FOREIGN KEY([matricula])
REFERENCES [dbo].[alumnos] ([matricula])
GO
ALTER TABLE [dbo].[inasistencias] CHECK CONSTRAINT [fk_matricula_inasistencia]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [fk_municipio] FOREIGN KEY([Municipio])
REFERENCES [dbo].[municipios] ([idMunicipio])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [fk_municipio]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [fk_tipoLoc_localidaes] FOREIGN KEY([tipo])
REFERENCES [dbo].[tiposLocalidad] ([idTipoLoc])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [fk_tipoLoc_localidaes]
GO
ALTER TABLE [dbo].[materias]  WITH CHECK ADD  CONSTRAINT [fk_carrera_materia] FOREIGN KEY([carrera])
REFERENCES [dbo].[carreras] ([idCarrera])
GO
ALTER TABLE [dbo].[materias] CHECK CONSTRAINT [fk_carrera_materia]
GO
ALTER TABLE [dbo].[municipios]  WITH CHECK ADD  CONSTRAINT [fk_estado] FOREIGN KEY([Estado])
REFERENCES [dbo].[estados] ([idEstado])
GO
ALTER TABLE [dbo].[municipios] CHECK CONSTRAINT [fk_estado]
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD FOREIGN KEY([localidades])
REFERENCES [dbo].[localidades] ([idLocalidad])
GO
ALTER TABLE [dbo].[profesores]  WITH CHECK ADD  CONSTRAINT [fk_academia] FOREIGN KEY([idAcademia])
REFERENCES [dbo].[academias] ([idAcademia])
GO
ALTER TABLE [dbo].[profesores] CHECK CONSTRAINT [fk_academia]
GO
ALTER TABLE [dbo].[profesores]  WITH CHECK ADD  CONSTRAINT [fk_empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[profesores] CHECK CONSTRAINT [fk_empleado]
GO
USE [master]
GO
ALTER DATABASE [BaseDeDatosTec] SET  READ_WRITE 
GO
