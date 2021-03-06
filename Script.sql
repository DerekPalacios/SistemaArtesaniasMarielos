USE [master]
GO
/****** Object:  Database [ArtesaniasVentasArticulosCompras]    Script Date: 3/2/2022 10:15:59 ******/
CREATE DATABASE [ArtesaniasVentasArticulosCompras]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ArtesaniasVentasArticulosCompras', FILENAME = N'D:\MSSQL15.MSSQLSERVER\MSSQL\DATA\ArtesaniasVentasArticulosCompras.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ArtesaniasVentasArticulosCompras_log', FILENAME = N'D:\MSSQL15.MSSQLSERVER\MSSQL\DATA\ArtesaniasVentasArticulosCompras_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ArtesaniasVentasArticulosCompras].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET RECOVERY FULL 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET  MULTI_USER 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ArtesaniasVentasArticulosCompras', N'ON'
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET QUERY_STORE = OFF
GO
USE [ArtesaniasVentasArticulosCompras]
GO
/****** Object:  Table [dbo].[tbl_Articulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Articulo](
	[Id_Articulo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Articulo] [nvarchar](10) NULL,
	[Nombre_Articulo] [nvarchar](50) NULL,
	[Descripcion_Articulo] [nvarchar](200) NULL,
	[Id_Categoria_Articulo] [int] NULL,
 CONSTRAINT [PK_tbl_Articulo] PRIMARY KEY CLUSTERED 
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CaracteristicaArticulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CaracteristicaArticulo](
	[Id_Caracteristica] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Caracteristica] [nchar](50) NULL,
 CONSTRAINT [PK_tbl_CaracteristicasArticulos] PRIMARY KEY CLUSTERED 
(
	[Id_Caracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CategoriaArticulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CategoriaArticulo](
	[Id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Categoria] [nvarchar](50) NULL,
	[Descripcion_Categoria] [nvarchar](200) NULL,
 CONSTRAINT [PK_tbl_CategoriaArticulo] PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CategoriaCaracteristicaArticulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CategoriaCaracteristicaArticulo](
	[Id_CategoriaCaracteristicaArticulo] [int] IDENTITY(1,1) NOT NULL,
	[Id_CategoriaArticulo] [int] NULL,
	[Id_CaracteristicaArticulo] [int] NULL,
 CONSTRAINT [PK_tbl_CategoriasCaracteristicasArticulos] PRIMARY KEY CLUSTERED 
(
	[Id_CategoriaCaracteristicaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Cliente]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Cliente](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Cliente] [nvarchar](50) NULL,
	[Identifiacion_Cliente] [nvarchar](50) NULL,
	[Direccion_Cliente] [nvarchar](300) NULL,
	[Telefono_Cliente] [nvarchar](11) NULL,
 CONSTRAINT [PK_tbl_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CompraArticulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CompraArticulo](
	[Id_Compra] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Compra] [int] NULL,
	[Fecha_Compra] [date] NULL,
	[Id_Proveedor_Compra] [int] NULL,
	[PrecioTotal_Compra] [decimal](16, 2) NULL,
	[IVA_Compra] [int] NULL,
 CONSTRAINT [PK_tbl_CompraArticulo] PRIMARY KEY CLUSTERED 
(
	[Id_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleArticuloArte]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleArticuloArte](
	[Id_DetalleArticuloArte] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo_DetalleArte] [int] NULL,
	[Tamaño_DetalleArte] [nvarchar](50) NULL,
	[Material_DetalleArte] [nvarchar](50) NULL,
	[Precio_DetalleArte] [decimal](16, 2) NULL,
 CONSTRAINT [PK_tbl_DetalleArticuloArte] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleArticuloArte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleArticuloCalzado]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleArticuloCalzado](
	[Id_DetalleArticulocalzado] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo_DetalleCalzado] [int] NULL,
	[Genero_DetalleCalzado] [nvarchar](50) NULL,
	[CategoriaPersona_DetalleCalzado] [nvarchar](50) NULL,
	[Material_DetalleCalzado] [nvarchar](50) NULL,
	[Numeracion_DetalleCalzado] [nvarchar](50) NULL,
	[Precio_DetalleCalzado] [decimal](16, 2) NULL,
 CONSTRAINT [PK_tbl_DetalleArticuloCalzado] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleArticulocalzado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleArticuloComplemento]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleArticuloComplemento](
	[Id_DetalleArticuloComplemento] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo_DetalleComplemento] [int] NULL,
	[Tamaño_DetalleComplemento] [nvarchar](50) NULL,
	[Genero_DetalleComplemento] [nvarchar](50) NULL,
	[CategoriaPersona_DetalleComplemento] [nvarchar](50) NULL,
	[Material_DetalleComplemento] [nvarchar](50) NULL,
	[Precio_DetalleComplemento] [decimal](16, 2) NULL,
 CONSTRAINT [PK_tbl_DetalleArticuloComplemento] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleArticuloComplemento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleArticuloHogar]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleArticuloHogar](
	[Id_DetalleArticuloHogar] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo_DetalleHogar] [int] NULL,
	[Tamaño_DetalleHogar] [nvarchar](50) NULL,
	[Material_DetalleHogar] [nvarchar](50) NULL,
	[Precio_DetalleHogar] [decimal](16, 2) NULL,
 CONSTRAINT [PK_tbl_DetalleArticuloHogar] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleArticuloHogar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleArticuloJuguete]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleArticuloJuguete](
	[Id_DetalleArticuloJuguete] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo_DetalleJuguete] [int] NULL,
	[Tamaño_DetalleJuguete] [nvarchar](50) NULL,
	[Genero_DetalleJuguete] [nvarchar](50) NULL,
	[CategoriaPersona_DetalleJuguete] [nvarchar](50) NULL,
	[Material_DetalleJuguete] [nvarchar](50) NULL,
	[Precio_DetalleJuguete] [decimal](15, 2) NULL,
 CONSTRAINT [PK_tbl_DetalleArticuloJuguete] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleArticuloJuguete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleArticuloTextil]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleArticuloTextil](
	[Id_DetalleArticuloTextil] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo_DetalleTextil] [int] NULL,
	[Talla_DetalleTextil] [nvarchar](50) NULL,
	[Material_DetalleTextil] [nvarchar](50) NULL,
	[Genero_DetalleTextil] [nvarchar](50) NULL,
	[CategoriaPersona_DetalleTextil] [nvarchar](50) NULL,
	[Numeracion_DetalleTextil] [varchar](10) NULL,
	[Precio_DetalleTextil] [decimal](16, 2) NULL,
 CONSTRAINT [PK__tbl_Deta__E5A56179321B2A94] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleArticuloTextil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleCaracteristicaArticulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleCaracteristicaArticulo](
	[Id_DetalleCaracteristicaArticulo] [int] IDENTITY(1,1) NOT NULL,
	[Id_Caracteristica_DetalleCaracteristicaArticulo] [int] NULL,
	[Detalle_DetalleCaracterisrticaArticulo] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_DetalleCaracteristicaArticulo] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleCaracteristicaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleCompraArticulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleCompraArticulo](
	[Id_DetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo_DetalleCompra] [int] NULL,
	[Id_DetalleArticulo] [int] NULL,
	[Cantidad_DetalleCompra] [int] NULL,
	[Id_Compra_DetalleCompra] [int] NULL,
	[Descuento_DetalleCompra] [decimal](16, 2) NULL,
 CONSTRAINT [PK_tbl_DetalleCompraArticulo] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DetalleVentaArticulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DetalleVentaArticulo](
	[Id_DetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo_DetalleVenta] [int] NULL,
	[Id_DertalleArticulo_DetalleVenta] [int] NULL,
	[Cantidad_DetalleVenta] [int] NULL,
	[Id_VentaArticulo_DetalleVenta] [int] NULL,
	[Descuento_DetalleVenta] [decimal](16, 2) NULL,
 CONSTRAINT [PK_tbl_DetalleVentaArticulo] PRIMARY KEY CLUSTERED 
(
	[Id_DetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_InventarioArticulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_InventarioArticulo](
	[Id_Inventario] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo_Inventario] [int] NULL,
	[Id_DetalleArticulo_Inventario] [int] NULL,
	[Stock_Inventario] [int] NULL,
	[PrecioStock_Inventario] [decimal](15, 2) NULL,
 CONSTRAINT [PK_tbl_InventarioArticulo] PRIMARY KEY CLUSTERED 
(
	[Id_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Proveedor]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Proveedor](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Proveedor] [nchar](10) NULL,
	[Nombre_Empresa] [nchar](10) NULL,
	[Telefono_Proveedor] [nvarchar](11) NULL,
 CONSTRAINT [PK_tbl_Proveedor] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VentaArticulo]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VentaArticulo](
	[Id_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Venta] [int] NULL,
	[Fecha_Venta] [date] NULL,
	[Id_Cliente] [int] NULL,
	[Precio_Venta] [decimal](16, 2) NULL,
	[Recibido_Venta] [decimal](16, 2) NULL,
	[IVA_Venta] [decimal](4, 2) NULL,
 CONSTRAINT [PK_tbl_VentaArticulo] PRIMARY KEY CLUSTERED 
(
	[Id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblConfiguracion]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblConfiguracion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConfEncabezadoFactura] [varchar](100) NOT NULL,
	[NombrePropietario] [varchar](50) NOT NULL,
	[NombreTienda] [varchar](30) NOT NULL,
	[N_Ruc] [varchar](30) NULL,
	[ConfTelefono] [varchar](8) NOT NULL,
	[ConfDireccion] [varchar](100) NOT NULL,
	[ConfCorreo] [varchar](50) NULL,
 CONSTRAINT [PK__TblConfi__3214EC0765DAC092] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRol]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Rol] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUsuario]    Script Date: 3/2/2022 10:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Nombre_Usuario] [varchar](20) NOT NULL,
	[Clave] [varchar](20) NOT NULL,
	[ConfirmarClave] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Articulo] ON 

INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (1, N'HG-001', N'Juego de Cacique', N'Calado en pie', 1)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (2, N'HG-002', N'Porta Llave', N'Mapa Division Politica', 1)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (3, N'HG-003', N'Juego de Cucharas', N'Tenedor y Cuchillo', 1)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (22, N'HG-004', N'Juego de Mariposas', N'San Rafael', 1)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (23, N'HG-005', N'Juego de Jarrones', N'Para adornar sala', 1)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (24, N'HG-006', N'Pescado Pintado', N'Balsa', 1)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (25, N'TX-001', N'Traje de Palo de Mayo', N'xxxx', 2)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (26, N'TX-002', N'Cotona Indú', N'xxxxxx', 2)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (27, N'TX-003', N'Batas', N'Manta ojo de pollo', 2)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (28, N'TX-004', N'Blusa Campesina', N'Chaly bordada', 2)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (29, N'TX-005', N'Vestido', N'Blanco Calado', 2)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (30, N'ART-001', N'Cuadro Pintado Acrilico', N'Dibujo de paisaje', 3)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (31, N'JG-001', N'Guitarra', N'Guitarra de madera', 4)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (32, N'JG-002', N'Muñeca con trenzas', N'Muñeca para niña', 4)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (33, N'JG-003', N'Marimba', N'Marimba de Madera', 4)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (34, N'JG-004', N'Trompo', N'Trompo de Madera', 4)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (35, N'JG-005', N'Maracas', N'Maracas de Madera', 4)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (36, N'CZ-001', N'Zapatito', N'Tejido', 5)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (37, N'CZ-002', N'Caite', N'xxxx', 5)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (38, N'CZ-003', N'Sandalias', N'Trompa Perro', 5)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (39, N'CP-001', N'Alajero', N'Pirograbado', 6)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (40, N'CP-002', N'Juego de Chapas', N'De Niaragua', 6)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (41, N'CP-003', N'Atrapasueños', N'Alejar Pesadillas', 6)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (42, N'CP-004', N'Pulsera', N'De amistad', 6)
INSERT [dbo].[tbl_Articulo] ([Id_Articulo], [Codigo_Articulo], [Nombre_Articulo], [Descripcion_Articulo], [Id_Categoria_Articulo]) VALUES (43, N'CP-005', N'Collar', N'Para Salir', 6)
SET IDENTITY_INSERT [dbo].[tbl_Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CaracteristicaArticulo] ON 

INSERT [dbo].[tbl_CaracteristicaArticulo] ([Id_Caracteristica], [Nombre_Caracteristica]) VALUES (1, N'Tamaño                                            ')
INSERT [dbo].[tbl_CaracteristicaArticulo] ([Id_Caracteristica], [Nombre_Caracteristica]) VALUES (2, N'Talla                                             ')
INSERT [dbo].[tbl_CaracteristicaArticulo] ([Id_Caracteristica], [Nombre_Caracteristica]) VALUES (3, N'Material                                          ')
INSERT [dbo].[tbl_CaracteristicaArticulo] ([Id_Caracteristica], [Nombre_Caracteristica]) VALUES (4, N'Numeracion                                        ')
INSERT [dbo].[tbl_CaracteristicaArticulo] ([Id_Caracteristica], [Nombre_Caracteristica]) VALUES (5, N'Genero                                            ')
INSERT [dbo].[tbl_CaracteristicaArticulo] ([Id_Caracteristica], [Nombre_Caracteristica]) VALUES (6, N'Categoria Persona                                 ')
SET IDENTITY_INSERT [dbo].[tbl_CaracteristicaArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CategoriaArticulo] ON 

INSERT [dbo].[tbl_CategoriaArticulo] ([Id_Categoria], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (1, N'Hogar', N'Categoria Hogar')
INSERT [dbo].[tbl_CategoriaArticulo] ([Id_Categoria], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (2, N'Textil', N'Categoria Textil')
INSERT [dbo].[tbl_CategoriaArticulo] ([Id_Categoria], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3, N'Arte', N'Categoria Arte')
INSERT [dbo].[tbl_CategoriaArticulo] ([Id_Categoria], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (4, N'Juguete', N'Categoria Juguete')
INSERT [dbo].[tbl_CategoriaArticulo] ([Id_Categoria], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (5, N'Calzado', N'Categoria Calzado')
INSERT [dbo].[tbl_CategoriaArticulo] ([Id_Categoria], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (6, N'Complemento', N'Categoria Complemento')
SET IDENTITY_INSERT [dbo].[tbl_CategoriaArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ON 

INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (1, 1, 1)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (2, 1, 3)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (3, 2, 2)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (4, 2, 5)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (5, 2, 6)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (6, 2, 4)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (7, 2, 3)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (8, 3, 1)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (9, 3, 3)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (10, 4, 1)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (11, 4, 5)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (12, 4, 6)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (13, 4, 3)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (14, 5, 5)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (15, 5, 6)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (16, 5, 3)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (17, 5, 4)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (18, 6, 1)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (19, 6, 5)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (20, 6, 6)
INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] ([Id_CategoriaCaracteristicaArticulo], [Id_CategoriaArticulo], [Id_CaracteristicaArticulo]) VALUES (21, 6, 3)
SET IDENTITY_INSERT [dbo].[tbl_CategoriaCaracteristicaArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Cliente] ON 

INSERT [dbo].[tbl_Cliente] ([Id_Cliente], [Nombre_Cliente], [Identifiacion_Cliente], [Direccion_Cliente], [Telefono_Cliente]) VALUES (1, N'Alberto', N'12121212', N'Por ahi', N'11223344')
INSERT [dbo].[tbl_Cliente] ([Id_Cliente], [Nombre_Cliente], [Identifiacion_Cliente], [Direccion_Cliente], [Telefono_Cliente]) VALUES (2, N'Silver', N'13131313', N'Del reloj 1c al Norte', N'22334455')
INSERT [dbo].[tbl_Cliente] ([Id_Cliente], [Nombre_Cliente], [Identifiacion_Cliente], [Direccion_Cliente], [Telefono_Cliente]) VALUES (3, N'Juan', N'14141414', N'acuya', N'33445566')
SET IDENTITY_INSERT [dbo].[tbl_Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CompraArticulo] ON 

INSERT [dbo].[tbl_CompraArticulo] ([Id_Compra], [Numero_Compra], [Fecha_Compra], [Id_Proveedor_Compra], [PrecioTotal_Compra], [IVA_Compra]) VALUES (2, 12, CAST(N'2022-01-21' AS Date), 5, CAST(1000.00 AS Decimal(16, 2)), NULL)
INSERT [dbo].[tbl_CompraArticulo] ([Id_Compra], [Numero_Compra], [Fecha_Compra], [Id_Proveedor_Compra], [PrecioTotal_Compra], [IVA_Compra]) VALUES (1003, 14, CAST(N'2022-01-31' AS Date), 4, CAST(1150.00 AS Decimal(16, 2)), 15)
INSERT [dbo].[tbl_CompraArticulo] ([Id_Compra], [Numero_Compra], [Fecha_Compra], [Id_Proveedor_Compra], [PrecioTotal_Compra], [IVA_Compra]) VALUES (1005, 16, CAST(N'2022-02-02' AS Date), 6, CAST(690.00 AS Decimal(16, 2)), 15)
INSERT [dbo].[tbl_CompraArticulo] ([Id_Compra], [Numero_Compra], [Fecha_Compra], [Id_Proveedor_Compra], [PrecioTotal_Compra], [IVA_Compra]) VALUES (1006, 17, CAST(N'2022-02-02' AS Date), 6, CAST(345.00 AS Decimal(16, 2)), 15)
INSERT [dbo].[tbl_CompraArticulo] ([Id_Compra], [Numero_Compra], [Fecha_Compra], [Id_Proveedor_Compra], [PrecioTotal_Compra], [IVA_Compra]) VALUES (1007, 18, CAST(N'2022-02-02' AS Date), 5, CAST(3105.00 AS Decimal(16, 2)), 15)
INSERT [dbo].[tbl_CompraArticulo] ([Id_Compra], [Numero_Compra], [Fecha_Compra], [Id_Proveedor_Compra], [PrecioTotal_Compra], [IVA_Compra]) VALUES (1008, 19, CAST(N'2022-02-02' AS Date), 6, CAST(517.50 AS Decimal(16, 2)), 15)
INSERT [dbo].[tbl_CompraArticulo] ([Id_Compra], [Numero_Compra], [Fecha_Compra], [Id_Proveedor_Compra], [PrecioTotal_Compra], [IVA_Compra]) VALUES (1009, 20, CAST(N'2022-02-02' AS Date), 4, CAST(575.00 AS Decimal(16, 2)), 15)
SET IDENTITY_INSERT [dbo].[tbl_CompraArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloArte] ON 

INSERT [dbo].[tbl_DetalleArticuloArte] ([Id_DetalleArticuloArte], [Id_Articulo_DetalleArte], [Tamaño_DetalleArte], [Material_DetalleArte], [Precio_DetalleArte]) VALUES (1, 30, N'Grande', N'Madera', CAST(2500.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloArte] ([Id_DetalleArticuloArte], [Id_Articulo_DetalleArte], [Tamaño_DetalleArte], [Material_DetalleArte], [Precio_DetalleArte]) VALUES (2, 30, N'Mediano', N'Madera', CAST(1500.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloArte] ([Id_DetalleArticuloArte], [Id_Articulo_DetalleArte], [Tamaño_DetalleArte], [Material_DetalleArte], [Precio_DetalleArte]) VALUES (3, 30, N'Pequeño', N'Madera', CAST(900.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloArte] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloCalzado] ON 

INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (1, 36, N'Unisex', N'Infantil', N'Lana', N'2', CAST(150.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (2, 37, N'Unisex', N'Adulto', N'Cuero', N'35', CAST(250.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (3, 37, N'Unisex', N'Infantil', N'Cuero', N'5', CAST(250.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (4, 37, N'Unisex ', N'Adulto', N'Cuero', N'36', CAST(250.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (5, 37, N'Unisex', N'Adulto', N'Cuero', N'37', CAST(250.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (6, 38, N'Masculino', N'Adulto', N'Cuero', N'35', CAST(300.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (7, 38, N'Masculino', N'Juvenil', N'Cuero', N'38', CAST(300.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (8, 38, N'Masculino', N'Niño', N'Cuero', N'8', CAST(150.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (9, 38, N'Masculino', N'Niño', N'Cuero', N'9', CAST(150.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloCalzado] ([Id_DetalleArticulocalzado], [Id_Articulo_DetalleCalzado], [Genero_DetalleCalzado], [CategoriaPersona_DetalleCalzado], [Material_DetalleCalzado], [Numeracion_DetalleCalzado], [Precio_DetalleCalzado]) VALUES (10, 38, N'Masculino ', N'Adulto', N'Cuero', N'40', CAST(350.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloCalzado] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloComplemento] ON 

INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (1, 39, NULL, N'Femenino', N'Adulto', N'Madera', CAST(300.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (2, 39, N'Fe', N'Femenino', N'Adulto', N'Porcelana', CAST(400.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (3, 40, NULL, N'Femenino', N'Juvenil', N'Pluma', CAST(80.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (4, 40, NULL, N'Femenino', N'Juvenil', N'Pelotitas', CAST(50.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (5, 40, NULL, N'Femenino', N'Juvenil', N'Acero', CAST(150.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (6, 41, NULL, N'Unisex', N'Adulto', N'Madera', CAST(200.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (7, 42, NULL, N'Unisex', N'Juvenil', N'hilo', CAST(35.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (8, 42, NULL, N'Unisex', N'Juvenil', N'Silicona', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (9, 42, NULL, N'Unisex', N'Juvenil', N'Goma', CAST(150.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloComplemento] ([Id_DetalleArticuloComplemento], [Id_Articulo_DetalleComplemento], [Tamaño_DetalleComplemento], [Genero_DetalleComplemento], [CategoriaPersona_DetalleComplemento], [Material_DetalleComplemento], [Precio_DetalleComplemento]) VALUES (10, 43, NULL, N'Femenino', N'Juvenil', N'Acero', CAST(200.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloComplemento] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloHogar] ON 

INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (1, 1, N'Grande', N'Madera', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (2, 1, N'Pequeño', N'Madera', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (3, 1, N'Mediano', N'Madera', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (4, 2, N'Grande', N'Madera', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (5, 2, N'Pequeño', N'Madera', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (6, 2, N'Mediano', N'Madera', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (7, 3, N'Mediano', N'Madera', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (8, 22, N'Grande', N'Barro', CAST(270.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (9, 22, N'Pequeño', N'Barro', CAST(270.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (10, 22, N'Mediano', N'Barro', CAST(270.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (11, 23, N'Grande', N'Barro', CAST(270.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (12, 23, N'Pequeño', N'Barro', CAST(270.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (13, 23, N'Mediano', N'Barro', CAST(270.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (14, 24, N'Mediano', N'Madera', CAST(270.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloHogar] ([Id_DetalleArticuloHogar], [Id_Articulo_DetalleHogar], [Tamaño_DetalleHogar], [Material_DetalleHogar], [Precio_DetalleHogar]) VALUES (15, 24, N'Pequeño', N'Madera', CAST(270.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloHogar] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloJuguete] ON 

INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (1, 31, N'Grande', N'Unisex', N'Infantil', N'Madera', CAST(500.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (2, 31, N'Mediano', N'Unisex', N'Infantil', N'Madera', CAST(350.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (3, 31, N'Pequeño', N'Unisex', N'Infantil', N'Madera', CAST(150.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (4, 32, N'Mediano', N'Femenino', N'Niña', N'Tela', CAST(150.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (5, 32, N'Pequeña', N'Femenino', N'Niña', N'Tela', CAST(100.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (6, 33, N'Grande', N'Unisex', N'Infantil', N'Madera', CAST(500.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (7, 33, N'Mediano', N'Unisex', N'Infantil', N'Madera', CAST(450.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (8, 33, N'Pequeño', N'Unisex', N'Infantil', N'Madera', CAST(250.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (9, 34, N'Pequeño', N'Masculino', N'Niño', N'Madera', CAST(70.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_DetalleArticuloJuguete] ([Id_DetalleArticuloJuguete], [Id_Articulo_DetalleJuguete], [Tamaño_DetalleJuguete], [Genero_DetalleJuguete], [CategoriaPersona_DetalleJuguete], [Material_DetalleJuguete], [Precio_DetalleJuguete]) VALUES (10, 35, N'Mediano', N'Unisex', N'Infantil', N'Madera', CAST(55.00 AS Decimal(15, 2)))
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloJuguete] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloTextil] ON 

INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (1, 25, N'S/T', N'Algodon', N'Femenino', N'Niña', N'12', CAST(400.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (2, 25, N'M', N'Algodon', N'Femenino', N'Adulto', N'S/N', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (3, 25, N'L', N'Algodon', N'Femenino', N'Adulto', N'S/N', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (4, 26, N'S/T', N'Dacron', N'Masculino', N'Adulto', N'3/4', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (5, 26, N'S/T', N'Dacron', N'Masculino', N'Niño', N'4', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (6, 27, N'XL', N'Algodon', N'Unisex', N'Adulto', N'S/N', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (7, 27, N'M', N'Algodon', N'Femenino', N'Niña', N'S/N', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (8, 27, N'L', N'Algodon', N'Unisex', N'Adulto', N'S/N', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (9, 28, N'M', N'Seda', N'Femenino', N'Adulto', N'S/N', CAST(100.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (10, 28, N'S', N'Seda', N'Femenino', N'Juvenil', N'S/N', CAST(300.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (11, 29, N'S/T', N'Blonda', N'Femenino', N'Niña', N'12', CAST(450.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleArticuloTextil] ([Id_DetalleArticuloTextil], [Id_Articulo_DetalleTextil], [Talla_DetalleTextil], [Material_DetalleTextil], [Genero_DetalleTextil], [CategoriaPersona_DetalleTextil], [Numeracion_DetalleTextil], [Precio_DetalleTextil]) VALUES (12, 29, N'M', N'Algodon', N'Femenino', N'Juvenil', N'S/N', CAST(450.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[tbl_DetalleArticuloTextil] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ON 

INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (1, 1, N'Grande')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (2, 1, N'Mediano')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (3, 1, N'Pequeño')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (30, 2, N'S')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (31, 2, N'M')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (32, 2, N'L')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (33, 2, N'XL')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (34, 3, N'Barro')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (35, 3, N'Madera')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (36, 3, N'Plástico')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (37, 3, N'Dacron')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (38, 3, N'Manta Indú')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (39, 3, N'Lino')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (40, 3, N'Pita')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (41, 3, N'Paja')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (42, 3, N'Tusa')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (43, 3, N'Mecate')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (44, 3, N'Palma')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (45, 3, N'Lana')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (46, 3, N'Manila')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (47, 3, N'Madeja')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (48, 3, N'Tela')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (49, 3, N'Plumas')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (50, 3, N'Piedra')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (51, 4, N'35')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (52, 4, N'36')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (53, 4, N'37')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (54, 4, N'38')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (55, 4, N'39')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (56, 4, N'48')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (57, 5, N'Masculino')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (58, 5, N'Femenino')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (59, 5, N'Unisex')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (60, 6, N'Juvenil')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (61, 6, N'Niño')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (62, 6, N'Niña')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (67, 6, N'Adulto')
INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] ([Id_DetalleCaracteristicaArticulo], [Id_Caracteristica_DetalleCaracteristicaArticulo], [Detalle_DetalleCaracterisrticaArticulo]) VALUES (68, 6, N'Infantil')
SET IDENTITY_INSERT [dbo].[tbl_DetalleCaracteristicaArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetalleCompraArticulo] ON 

INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (2, 1, 2, 10, 2, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1003, 25, 2, 10, 1003, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1007, 1, 1, 2, 1005, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1008, 1, 2, 2, 1005, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1009, 1, 3, 2, 1005, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1010, 1, 1, 1, 1006, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1011, 1, 2, 1, 1006, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1012, 1, 3, 1, 1006, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1013, 1, 1, 9, 1007, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1014, 1, 2, 9, 1007, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1015, 1, 3, 9, 1007, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1016, 25, 3, 5, 1008, CAST(10.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleCompraArticulo] ([Id_DetalleCompra], [Id_Articulo_DetalleCompra], [Id_DetalleArticulo], [Cantidad_DetalleCompra], [Id_Compra_DetalleCompra], [Descuento_DetalleCompra]) VALUES (1017, 1, 1, 5, 1009, CAST(0.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[tbl_DetalleCompraArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DetalleVentaArticulo] ON 

INSERT [dbo].[tbl_DetalleVentaArticulo] ([Id_DetalleVenta], [Id_Articulo_DetalleVenta], [Id_DertalleArticulo_DetalleVenta], [Cantidad_DetalleVenta], [Id_VentaArticulo_DetalleVenta], [Descuento_DetalleVenta]) VALUES (1002, 25, 2, 10, 1002, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleVentaArticulo] ([Id_DetalleVenta], [Id_Articulo_DetalleVenta], [Id_DertalleArticulo_DetalleVenta], [Cantidad_DetalleVenta], [Id_VentaArticulo_DetalleVenta], [Descuento_DetalleVenta]) VALUES (1003, 1, 2, 2, 1003, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleVentaArticulo] ([Id_DetalleVenta], [Id_Articulo_DetalleVenta], [Id_DertalleArticulo_DetalleVenta], [Cantidad_DetalleVenta], [Id_VentaArticulo_DetalleVenta], [Descuento_DetalleVenta]) VALUES (1004, 1, 2, 15, 1004, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleVentaArticulo] ([Id_DetalleVenta], [Id_Articulo_DetalleVenta], [Id_DertalleArticulo_DetalleVenta], [Cantidad_DetalleVenta], [Id_VentaArticulo_DetalleVenta], [Descuento_DetalleVenta]) VALUES (1005, 1, 2, 1, 1005, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleVentaArticulo] ([Id_DetalleVenta], [Id_Articulo_DetalleVenta], [Id_DertalleArticulo_DetalleVenta], [Cantidad_DetalleVenta], [Id_VentaArticulo_DetalleVenta], [Descuento_DetalleVenta]) VALUES (1006, 1, 1, 4, 1006, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleVentaArticulo] ([Id_DetalleVenta], [Id_Articulo_DetalleVenta], [Id_DertalleArticulo_DetalleVenta], [Cantidad_DetalleVenta], [Id_VentaArticulo_DetalleVenta], [Descuento_DetalleVenta]) VALUES (1007, 26, 4, 3, 1007, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleVentaArticulo] ([Id_DetalleVenta], [Id_Articulo_DetalleVenta], [Id_DertalleArticulo_DetalleVenta], [Cantidad_DetalleVenta], [Id_VentaArticulo_DetalleVenta], [Descuento_DetalleVenta]) VALUES (1008, 1, 2, 5, 1008, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[tbl_DetalleVentaArticulo] ([Id_DetalleVenta], [Id_Articulo_DetalleVenta], [Id_DertalleArticulo_DetalleVenta], [Cantidad_DetalleVenta], [Id_VentaArticulo_DetalleVenta], [Descuento_DetalleVenta]) VALUES (1009, 1, 2, 5, 1009, CAST(0.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[tbl_DetalleVentaArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_InventarioArticulo] ON 

INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (1, 1, 2, 490, CAST(-1600.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (2, 3, 6, 456, CAST(1150.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (3, 1, 1, 349, CAST(2512.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (4, 2, 2, 456, CAST(1212.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (5, 3, 3, 765, CAST(1212.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (6, 25, 1, 45, CAST(1212.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (7, 25, 2, 567, CAST(1212.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (8, 26, 4, 899, CAST(1012.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (9, 27, 7, 120, CAST(1212.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (10, 27, 8, 50, CAST(2332.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (11, 27, 9, 211, CAST(121212.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (12, 27, 10, 234, CAST(21.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (13, 26, 5, 324, CAST(345.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (14, 26, 6, 345, CAST(345.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (15, 1, 3, 133, CAST(1690.00 AS Decimal(15, 2)))
INSERT [dbo].[tbl_InventarioArticulo] ([Id_Inventario], [Id_Articulo_Inventario], [Id_DetalleArticulo_Inventario], [Stock_Inventario], [PrecioStock_Inventario]) VALUES (16, 25, 3, 5, CAST(517.50 AS Decimal(15, 2)))
SET IDENTITY_INSERT [dbo].[tbl_InventarioArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Proveedor] ON 

INSERT [dbo].[tbl_Proveedor] ([Id_Proveedor], [Nombre_Proveedor], [Nombre_Empresa], [Telefono_Proveedor]) VALUES (4, N'Augusto   ', N'Elite     ', N'88764564')
INSERT [dbo].[tbl_Proveedor] ([Id_Proveedor], [Nombre_Proveedor], [Nombre_Empresa], [Telefono_Proveedor]) VALUES (5, N'Erick     ', N'Blazor    ', N'1212')
INSERT [dbo].[tbl_Proveedor] ([Id_Proveedor], [Nombre_Proveedor], [Nombre_Empresa], [Telefono_Proveedor]) VALUES (6, N'Pedro     ', N'NIke      ', N'121212')
SET IDENTITY_INSERT [dbo].[tbl_Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_VentaArticulo] ON 

INSERT [dbo].[tbl_VentaArticulo] ([Id_Venta], [Numero_Venta], [Fecha_Venta], [Id_Cliente], [Precio_Venta], [Recibido_Venta], [IVA_Venta]) VALUES (1002, 6, CAST(N'2022-01-31' AS Date), 1, CAST(1150.00 AS Decimal(16, 2)), CAST(1200.00 AS Decimal(16, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[tbl_VentaArticulo] ([Id_Venta], [Numero_Venta], [Fecha_Venta], [Id_Cliente], [Precio_Venta], [Recibido_Venta], [IVA_Venta]) VALUES (1003, 7, CAST(N'2022-01-31' AS Date), 1, CAST(230.00 AS Decimal(16, 2)), CAST(230.00 AS Decimal(16, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[tbl_VentaArticulo] ([Id_Venta], [Numero_Venta], [Fecha_Venta], [Id_Cliente], [Precio_Venta], [Recibido_Venta], [IVA_Venta]) VALUES (1004, 8, CAST(N'2022-02-02' AS Date), 1, CAST(1725.00 AS Decimal(16, 2)), CAST(2000.00 AS Decimal(16, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[tbl_VentaArticulo] ([Id_Venta], [Numero_Venta], [Fecha_Venta], [Id_Cliente], [Precio_Venta], [Recibido_Venta], [IVA_Venta]) VALUES (1005, 9, CAST(N'2022-02-02' AS Date), 3, CAST(115.00 AS Decimal(16, 2)), CAST(150.00 AS Decimal(16, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[tbl_VentaArticulo] ([Id_Venta], [Numero_Venta], [Fecha_Venta], [Id_Cliente], [Precio_Venta], [Recibido_Venta], [IVA_Venta]) VALUES (1006, 10, CAST(N'2022-02-02' AS Date), 2, CAST(460.00 AS Decimal(16, 2)), CAST(500.00 AS Decimal(16, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[tbl_VentaArticulo] ([Id_Venta], [Numero_Venta], [Fecha_Venta], [Id_Cliente], [Precio_Venta], [Recibido_Venta], [IVA_Venta]) VALUES (1007, 11, CAST(N'2022-02-02' AS Date), 1, CAST(345.00 AS Decimal(16, 2)), CAST(400.00 AS Decimal(16, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[tbl_VentaArticulo] ([Id_Venta], [Numero_Venta], [Fecha_Venta], [Id_Cliente], [Precio_Venta], [Recibido_Venta], [IVA_Venta]) VALUES (1008, 12, CAST(N'2022-02-02' AS Date), 1, CAST(575.00 AS Decimal(16, 2)), CAST(600.00 AS Decimal(16, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[tbl_VentaArticulo] ([Id_Venta], [Numero_Venta], [Fecha_Venta], [Id_Cliente], [Precio_Venta], [Recibido_Venta], [IVA_Venta]) VALUES (1009, 13, CAST(N'2022-02-02' AS Date), 1, CAST(575.00 AS Decimal(16, 2)), CAST(600.00 AS Decimal(16, 2)), CAST(15.00 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[tbl_VentaArticulo] OFF
GO
SET IDENTITY_INSERT [dbo].[TblConfiguracion] ON 

INSERT [dbo].[TblConfiguracion] ([Id], [ConfEncabezadoFactura], [NombrePropietario], [NombreTienda], [N_Ruc], [ConfTelefono], [ConfDireccion], [ConfCorreo]) VALUES (2, N'Mi Tienda', N'María de los Ángeles', N'Artesanias Marielos', N'18181800', N'87657689', N'Del Reloj ', N'ArtesaniasMarielos@gmail.com')
SET IDENTITY_INSERT [dbo].[TblConfiguracion] OFF
GO
SET IDENTITY_INSERT [dbo].[TblRol] ON 

INSERT [dbo].[TblRol] ([Id], [Nombre_Rol]) VALUES (1, N'Administrador')
INSERT [dbo].[TblRol] ([Id], [Nombre_Rol]) VALUES (2, N'Vendedor')
SET IDENTITY_INSERT [dbo].[TblRol] OFF
GO
SET IDENTITY_INSERT [dbo].[TblUsuario] ON 

INSERT [dbo].[TblUsuario] ([Id], [IdRol], [Nombres], [Apellidos], [Nombre_Usuario], [Clave], [ConfirmarClave]) VALUES (2, 1, N'Alejandro', N'Moraga', N'AleG18', N'12345', N'12345')
SET IDENTITY_INSERT [dbo].[TblUsuario] OFF
GO
ALTER TABLE [dbo].[tbl_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Articulo_tbl_CategoriaArticulo] FOREIGN KEY([Id_Categoria_Articulo])
REFERENCES [dbo].[tbl_CategoriaArticulo] ([Id_Categoria])
GO
ALTER TABLE [dbo].[tbl_Articulo] CHECK CONSTRAINT [FK_tbl_Articulo_tbl_CategoriaArticulo]
GO
ALTER TABLE [dbo].[tbl_CategoriaCaracteristicaArticulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CategoriasCaracteristicasArticulos_tbl_CaracteristicasArticulos] FOREIGN KEY([Id_CaracteristicaArticulo])
REFERENCES [dbo].[tbl_CaracteristicaArticulo] ([Id_Caracteristica])
GO
ALTER TABLE [dbo].[tbl_CategoriaCaracteristicaArticulo] CHECK CONSTRAINT [FK_tbl_CategoriasCaracteristicasArticulos_tbl_CaracteristicasArticulos]
GO
ALTER TABLE [dbo].[tbl_CategoriaCaracteristicaArticulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CategoriasCaracteristicasArticulos_tbl_CategoriasArticulos] FOREIGN KEY([Id_CategoriaArticulo])
REFERENCES [dbo].[tbl_CategoriaArticulo] ([Id_Categoria])
GO
ALTER TABLE [dbo].[tbl_CategoriaCaracteristicaArticulo] CHECK CONSTRAINT [FK_tbl_CategoriasCaracteristicasArticulos_tbl_CategoriasArticulos]
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloArte]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleArticuloArte_tbl_Articulo] FOREIGN KEY([Id_Articulo_DetalleArte])
REFERENCES [dbo].[tbl_Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloArte] CHECK CONSTRAINT [FK_tbl_DetalleArticuloArte_tbl_Articulo]
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloCalzado]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleArticuloCalzado_tbl_Articulo] FOREIGN KEY([Id_Articulo_DetalleCalzado])
REFERENCES [dbo].[tbl_Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloCalzado] CHECK CONSTRAINT [FK_tbl_DetalleArticuloCalzado_tbl_Articulo]
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloComplemento]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleArticuloComplemento_tbl_Articulo] FOREIGN KEY([Id_Articulo_DetalleComplemento])
REFERENCES [dbo].[tbl_Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloComplemento] CHECK CONSTRAINT [FK_tbl_DetalleArticuloComplemento_tbl_Articulo]
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloHogar]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleArticuloHogar_tbl_Articulo] FOREIGN KEY([Id_Articulo_DetalleHogar])
REFERENCES [dbo].[tbl_Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloHogar] CHECK CONSTRAINT [FK_tbl_DetalleArticuloHogar_tbl_Articulo]
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloJuguete]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleArticuloJuguete_tbl_Articulo] FOREIGN KEY([Id_Articulo_DetalleJuguete])
REFERENCES [dbo].[tbl_Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloJuguete] CHECK CONSTRAINT [FK_tbl_DetalleArticuloJuguete_tbl_Articulo]
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloTextil]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Detal__Id_Ar__36B12243] FOREIGN KEY([Id_Articulo_DetalleTextil])
REFERENCES [dbo].[tbl_Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[tbl_DetalleArticuloTextil] CHECK CONSTRAINT [FK__tbl_Detal__Id_Ar__36B12243]
GO
ALTER TABLE [dbo].[tbl_DetalleCaracteristicaArticulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleCaracteristicaArticulo_tbl_CaracteristicaArticulo] FOREIGN KEY([Id_Caracteristica_DetalleCaracteristicaArticulo])
REFERENCES [dbo].[tbl_CaracteristicaArticulo] ([Id_Caracteristica])
GO
ALTER TABLE [dbo].[tbl_DetalleCaracteristicaArticulo] CHECK CONSTRAINT [FK_tbl_DetalleCaracteristicaArticulo_tbl_CaracteristicaArticulo]
GO
ALTER TABLE [dbo].[tbl_DetalleCompraArticulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleCompraArticulo_tbl_Articulo] FOREIGN KEY([Id_Articulo_DetalleCompra])
REFERENCES [dbo].[tbl_Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[tbl_DetalleCompraArticulo] CHECK CONSTRAINT [FK_tbl_DetalleCompraArticulo_tbl_Articulo]
GO
ALTER TABLE [dbo].[tbl_DetalleCompraArticulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleCompraArticulo_tbl_CompraArticulo] FOREIGN KEY([Id_Compra_DetalleCompra])
REFERENCES [dbo].[tbl_CompraArticulo] ([Id_Compra])
GO
ALTER TABLE [dbo].[tbl_DetalleCompraArticulo] CHECK CONSTRAINT [FK_tbl_DetalleCompraArticulo_tbl_CompraArticulo]
GO
ALTER TABLE [dbo].[tbl_DetalleVentaArticulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleVentaArticulo_tbl_Articulo] FOREIGN KEY([Id_Articulo_DetalleVenta])
REFERENCES [dbo].[tbl_Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[tbl_DetalleVentaArticulo] CHECK CONSTRAINT [FK_tbl_DetalleVentaArticulo_tbl_Articulo]
GO
ALTER TABLE [dbo].[tbl_DetalleVentaArticulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DetalleVentaArticulo_tbl_VentaArticulo] FOREIGN KEY([Id_VentaArticulo_DetalleVenta])
REFERENCES [dbo].[tbl_VentaArticulo] ([Id_Venta])
GO
ALTER TABLE [dbo].[tbl_DetalleVentaArticulo] CHECK CONSTRAINT [FK_tbl_DetalleVentaArticulo_tbl_VentaArticulo]
GO
ALTER TABLE [dbo].[tbl_InventarioArticulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_InventarioArticulo_tbl_Articulo] FOREIGN KEY([Id_Articulo_Inventario])
REFERENCES [dbo].[tbl_Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[tbl_InventarioArticulo] CHECK CONSTRAINT [FK_tbl_InventarioArticulo_tbl_Articulo]
GO
ALTER TABLE [dbo].[tbl_VentaArticulo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_VentaArticulo_tbl_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[tbl_Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[tbl_VentaArticulo] CHECK CONSTRAINT [FK_tbl_VentaArticulo_tbl_Cliente]
GO
ALTER TABLE [dbo].[TblUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TblUsuario_TblRol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[TblRol] ([Id])
GO
ALTER TABLE [dbo].[TblUsuario] CHECK CONSTRAINT [FK_TblUsuario_TblRol]
GO
USE [master]
GO
ALTER DATABASE [ArtesaniasVentasArticulosCompras] SET  READ_WRITE 
GO
