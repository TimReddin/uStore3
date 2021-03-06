IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_ProductStatuses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductCategories_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductCategories]'))
ALTER TABLE [dbo].[ProductCategories] DROP CONSTRAINT [FK_ProductCategories_Products]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductCategories_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductCategories]'))
ALTER TABLE [dbo].[ProductCategories] DROP CONSTRAINT [FK_ProductCategories_Categories]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[ProductStatuses]    Script Date: 2/23/2019 3:06:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[ProductStatuses]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/23/2019 3:06:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 2/23/2019 3:06:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategories]') AND type in (N'U'))
DROP TABLE [dbo].[ProductCategories]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/23/2019 3:06:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/23/2019 3:06:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/23/2019 3:06:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/23/2019 3:06:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/23/2019 3:06:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/23/2019 3:06:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/23/2019 3:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/23/2019 3:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/23/2019 3:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/23/2019 3:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/23/2019 3:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/23/2019 3:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 2/23/2019 3:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductCategories](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/23/2019 3:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](150) NOT NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[ProductImage] [varchar](75) NULL,
	[ProductStatusId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductStatuses]    Script Date: 2/23/2019 3:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductStatuses](
	[ProductStatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ProductStatuses] PRIMARY KEY CLUSTERED 
(
	[ProductStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ac1ccec3-5225-4404-a508-6ff9c5667ba1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'21991da3-ab39-49a4-a8c2-31143582a631', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'8b2f636d-476d-4f84-828d-5220fa3aa92c', N'Customer Service')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6489c56e-b74d-42e8-9388-86f5ec5343ff', N'21991da3-ab39-49a4-a8c2-31143582a631')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd7a78a20-95ac-4630-a15c-2b192fdc937c', N'8b2f636d-476d-4f84-828d-5220fa3aa92c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ad825e7c-9331-490c-8375-2a8fd2f6343d', N'ac1ccec3-5225-4404-a508-6ff9c5667ba1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6489c56e-b74d-42e8-9388-86f5ec5343ff', N'customer@ustore.com', 0, N'AF3vMVfuKAILobbenQO1eKZEl2QqbvOr1Ji7yWJ5jl2ueZjHFbbZSGHDhJYBdLE/WA==', N'e7d51e24-9352-44ff-8437-dd96df048722', NULL, 0, 0, NULL, 1, 0, N'customer@ustore.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ad825e7c-9331-490c-8375-2a8fd2f6343d', N'admin@ustore.com', 0, N'AOnxCbTmBnpbBzdiPr7m5YlzgJaTcS/3h1ygso5w363DY9MOlBW771DJhcHkwfnyrw==', N'ff6a5f2d-5ea8-4aea-b874-9e81a3f98db5', NULL, 0, 0, NULL, 0, 0, N'admin@ustore.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd7a78a20-95ac-4630-a15c-2b192fdc937c', N'cs@ustore.com', 0, N'AARg09csc5Iy//mUDxvkl4Yet13I1iNeVFMHwKG0KVhQPs5yBr9zAR42sy8q0ron+g==', N'b02d9158-f0e3-499c-b32b-b6e56afb366f', NULL, 0, 0, NULL, 1, 0, N'cs@ustore.com')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Action Adventure Game')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Open World Game')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Sports Game')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Equipment')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (1, N'Last of Us Remastered', N'Winner of over 200 Game of the Year awards, The Last of Us has been rebuilt for the PlayStation 4 system. Now featuring full 1080p, higher resolution character models, improved shadows and lighting, in addition to several other gameplay improvements. 20 years after a pandemic has radically changed known civilization, infected humans run wild and survivors are killing each other for food, weapons; whatever they can get their hands on. Joel, a violent survivor, is hired to smuggle a 14 year-old girl, Ellie, out of an oppressive military quarantine zone, but what starts as a small job soon transforms into a brutal journey across the U.S.', 23.8800, 20, N'_LastOfUsRemasteredBox.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (2, N'Uncharted: The Nathan Drake Collection', N'Play as Nathan Drake across a trilogy of thrilling, white-knuckle adventures. Experience Drake''s relationships with those closest to him, as he struggles to balance adventure and family.', 9.9900, 15, N'_UnchartedNDC.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (3, N'Horizon Zero Dawn', N'How have machines dominated this world, and what is their purpose? What happened to the civilization here before? Scour every corner of a realm filled with ancient relics and mysterious buildings in order to uncover your past and unearth the many secrets of a forgotten land.  Nature and Machines Collide Horizon Zero Dawn juxtaposes two contrasting elements, taking a vibrant world rich with beautiful nature and filling it with awe-inspiring highly advanced technology. This marriage creates a dynamic combination for both exploration and gameplay.  Defy Overwhelming Odds The foundation of combat in Horizon Zero Dawn is built upon the speed and cunning of Aloy versus the raw strength and size of the machines. In order to overcome a much larger and technologically superior enemy, Aloy must use every ounce of her knowledge, intelligence, and agility to survive each encounter.  Cutting Edge Open World Tech Stunningly detailed forests, imposing mountains, and atmospheric ruins of a bygone civilization meld together in a landscape that is alive with changing weather systems and a full day/night cycle.', 21.5000, 11, N'_HorizonZeroDawnBox.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (4, N'Bloodborne', N'Introducing Bloodborne, the latest Action RPG from renowned Japanese developer FromSoftware, exclusively for the PlayStation 4 system. Face your fears as you search for answers in the ancient city of Yharnam, now cursed with a strange endemic illness spreading through the streets like wildfire. Danger, death and madness lurk around every corner of this dark and horrific world, and you must discover its darkest secrets in order to survive. A Terrifying New World: Journey to a horror-filled gothic city where deranged mobs and nightmarish creatures lurk around every corner. Strategic Action Combat: Armed with a unique arsenal of weaponry, including guns and saw cleavers, you''ll need wits, strategy and reflexes to take down the agile and intelligent enemies that guard the city''s dark secrets.', 9.9700, 2, N'_BloodborneBox.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (5, N'God of War Remastered', N'God of War III has been remastered for the PLAYSTATION 4 (PS4) system and gameplay supports 1080p at 60fps. God of War III Remastered will bring epic battles to life with stunning graphics and an elaborate plot that puts Kratos at the center of carnage and destruction as he seeks revenge against the Gods who have betrayed him.Set in the realm of brutal Greek mythology, God of War III Remastered is the critically acclaimed single-player game that allows players to take on the fearless role of the ex-Spartan warrior, Kratos, as he rises from the darkest depths of Hades to scale the very heights of Mt Olympus and seek his bloody revenge on those who have betrayed him. Armed with double-chained blades and an array of new weapons and magic, Kratos must take on mythology''s deadliest creatures while solving intricate puzzles throughout his merciless quest to destroy Olympus.', 18.4700, NULL, N'_GodOfWarBox.jpg', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (6, N'Marvel''s Spiderman', N'Marvel’s Spider-Man features your favorite web-slinger in a story unlike any before it. Now a seasoned Super Hero, Peter Parker has been busy keeping crime off the streets as Spider-Man. Just as he’s ready to focus on life as Peter, a new villain threatens New York City. Faced with overwhelming odds and higher stakes, Spider-Man must rise up and be greater.', 39.9900, 10, N'_SpidermanBox.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (7, N'Red Dead Redemption 2', N'America, 1899. The end of the wild west era has begun as lawmen hunt down the last remaining outlaw gangs. Those who will not surrender or succumb are killed.  After a robbery goes badly wrong in the western town of Blackwater, Arthur Morgan and the Van der Linde gang are forced to flee. With federal agents and the best bounty hunters in the nation massing on their heels, the gang must rob, steal and fight their way across the rugged heartland of America in order to survive. As deepening internal divisions threaten to tear the gang apart, Arthur must make a choice between his own ideals and loyalty to the gang who raised him.', 59.8800, 10, N'_RedDeadRedemption2Box.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (8, N'Far Cry 5', N'Welcome to Hope County, Montana, land of the free and the brave, but also home to a fanatical doomsday cult known as Eden''s Gate. Stand up to the cult''s leader, Joseph Seed, his siblings, the Heralds, and spark the fires of resistance that will liberate your besieged community. From the savage mountain forest to the hamlet of Fall''s End, freely explore Montana''s rivers, lands, and skies in true Far Cry style, with more customizable weapons and vehicles than ever before. Carve your own path through a world that reacts to your decisions. Find your own way to survive, thrive, and beat back the forces of oppression. The stakes have never been higher.', 29.8800, 28, N'_FarCry5Box.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (9, N'Madden 19 Hall of Fame Edition', N'Achieve your gridiron greatness in Madden NFL 19 with more precision and control to win in all the ways you play. Prove your on-field stick-skills with more control over every step, in game-changing moments through the introduction of Real Player Motion. Take control over how you build your dynasty powered by all-new strategic team building tools and the first ever custom draft class creator in Franchise. Dominate the competition with all new ways to build and progress your NFL stars from the past and present in Ultimate Team.', 68.7500, 20, N'_Madden19HOFBox.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [Price], [UnitsInStock], [ProductImage], [ProductStatusId]) VALUES (10, N'NBA2K19', N'NBA 2K celebrates 20 years of redefining what sports gaming can be, from best in class gameplay to groundbreaking game modes and an immersive open-world ''Neighborhood.'' NBA 2K19 continues to push limits as it brings gaming one step closer to real-life basketball excitement and culture.', 36.6500, 7, N'_NBA2K19Box.jpg', 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductStatuses] ON 

INSERT [dbo].[ProductStatuses] ([ProductStatusId], [StatusName]) VALUES (1, N'Available')
INSERT [dbo].[ProductStatuses] ([ProductStatusId], [StatusName]) VALUES (2, N'Back-order')
INSERT [dbo].[ProductStatuses] ([ProductStatusId], [StatusName]) VALUES (3, N'Discontinued')
INSERT [dbo].[ProductStatuses] ([ProductStatusId], [StatusName]) VALUES (4, N'Pre-order')
SET IDENTITY_INSERT [dbo].[ProductStatuses] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductCategories_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductCategories]'))
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductCategories_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductCategories]'))
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Categories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductCategories_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductCategories]'))
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductCategories_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductCategories]'))
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Products]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductStatuses] FOREIGN KEY([ProductStatusId])
REFERENCES [dbo].[ProductStatuses] ([ProductStatusId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductStatuses]
GO
