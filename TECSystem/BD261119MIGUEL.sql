USE [master]
GO
/****** Object:  Database [BaseDeDatosTec]    Script Date: 26/11/2019 21:44:47 ******/
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
/****** Object:  Table [dbo].[academias]    Script Date: 26/11/2019 21:44:48 ******/
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
/****** Object:  Table [dbo].[actividades]    Script Date: 26/11/2019 21:44:49 ******/
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
/****** Object:  Table [dbo].[alumnos]    Script Date: 26/11/2019 21:44:49 ******/
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
/****** Object:  Table [dbo].[calificaciones]    Script Date: 26/11/2019 21:44:49 ******/
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
/****** Object:  Table [dbo].[calles]    Script Date: 26/11/2019 21:44:49 ******/
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
/****** Object:  Table [dbo].[carreras]    Script Date: 26/11/2019 21:44:49 ******/
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
/****** Object:  Table [dbo].[detActividades]    Script Date: 26/11/2019 21:44:49 ******/
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
/****** Object:  Table [dbo].[detGrupos]    Script Date: 26/11/2019 21:44:49 ******/
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
/****** Object:  Table [dbo].[empleados]    Script Date: 26/11/2019 21:44:49 ******/
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
/****** Object:  Table [dbo].[empleos]    Script Date: 26/11/2019 21:44:50 ******/
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
/****** Object:  Table [dbo].[especialidades]    Script Date: 26/11/2019 21:44:50 ******/
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
/****** Object:  Table [dbo].[estados]    Script Date: 26/11/2019 21:44:50 ******/
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
/****** Object:  Table [dbo].[grupos]    Script Date: 26/11/2019 21:44:50 ******/
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
/****** Object:  Table [dbo].[horarios]    Script Date: 26/11/2019 21:44:50 ******/
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
/****** Object:  Table [dbo].[inasistencias]    Script Date: 26/11/2019 21:44:50 ******/
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
/****** Object:  Table [dbo].[localidades]    Script Date: 26/11/2019 21:44:50 ******/
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
/****** Object:  Table [dbo].[materias]    Script Date: 26/11/2019 21:44:50 ******/
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
/****** Object:  Table [dbo].[municipios]    Script Date: 26/11/2019 21:44:50 ******/
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
/****** Object:  Table [dbo].[personas]    Script Date: 26/11/2019 21:44:51 ******/
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
/****** Object:  Table [dbo].[profesores]    Script Date: 26/11/2019 21:44:51 ******/
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
/****** Object:  Table [dbo].[tiposLocalidad]    Script Date: 26/11/2019 21:44:51 ******/
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
/****** Object:  Table [dbo].[usuarios_Login]    Script Date: 26/11/2019 21:44:51 ******/
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
