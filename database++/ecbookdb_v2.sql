-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Mai 2015 um 10:50
-- Server Version: 5.6.21
-- PHP-Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `ecbookdb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `abteilung`
--

CREATE TABLE IF NOT EXISTS `abteilung` (
  `abt_bezeichnung` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `abt_kuerzel` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `abt_vorstand` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `l_lehrerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `benutzergruppe`
--

CREATE TABLE IF NOT EXISTS `benutzergruppe` (
  `bg_id` int(11) NOT NULL,
  `bg_name` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `bg_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Daten für Tabelle `benutzergruppe`
--

INSERT INTO `benutzergruppe` (`bg_id`, `bg_name`, `bg_value`) VALUES
(1, 'admin', 10),
(2, 'Lehrer', 20),
(3, 'Schüler', 30),
(4, 'Eltern', 40);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `eltern`
--

CREATE TABLE IF NOT EXISTS `eltern` (
  `e_id` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `e_nachname` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `e_vorname` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `e_geburtsdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fehlstunde`
--

CREATE TABLE IF NOT EXISTS `fehlstunde` (
  `fs_datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fs_grund` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `s_schuelernummer` int(11) NOT NULL,
  `uf_bezeichnung` varchar(45) COLLATE utf8_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klasse`
--

CREATE TABLE IF NOT EXISTS `klasse` (
  `k_name` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `k_jahrgang` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `k_abschlussjahr` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `k_schueleranzahl` int(11) DEFAULT NULL,
  `k_abt_bezeichnung` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `k_semester` timestamp NULL DEFAULT NULL,
  `schf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `krankmeldung`
--

CREATE TABLE IF NOT EXISTS `krankmeldung` (
  `km_id` int(11) NOT NULL,
  `km_datum` timestamp NULL DEFAULT NULL,
  `km_unterschrift` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `s_schuelernummer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lehrer`
--

CREATE TABLE IF NOT EXISTS `lehrer` (
  `l_lehrerid` int(11) NOT NULL,
  `l_istklassenvorstand` tinyint(1) NOT NULL,
  `l_nachname` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `l_vorname` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `l_geburtsdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `m_name` int(11) NOT NULL,
  `m_url` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `m_anzeige` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `m_beschreibung` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8_estonian_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Daten für Tabelle `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1428564368),
('m130524_201442_init', 1428564378);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `p_nachname` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `p_vorname` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `p_geburtsdatum` date NOT NULL,
  `p_wohnort` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `p_plz` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `p_wohnadresse` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `p_telefonnummer` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `p_l_benutzername` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `p_l_passwort` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `bg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Daten für Tabelle `person`
--

INSERT INTO `person` (`p_nachname`, `p_vorname`, `p_geburtsdatum`, `p_wohnort`, `p_plz`, `p_wohnadresse`, `p_telefonnummer`, `p_l_benutzername`, `p_l_passwort`, `bg_id`) VALUES
('admin', 'admin', '2015-04-01', 'wien', '1050', 'spengergasse', '156112156', 'admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pruefung`
--

CREATE TABLE IF NOT EXISTS `pruefung` (
  `p_datum` date NOT NULL,
  `p_uhrzeit` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `uf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schueler`
--

CREATE TABLE IF NOT EXISTS `schueler` (
  `s_schuelernummer` int(11) NOT NULL,
  `s_religionsbekenntnis` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `s_istklassensprecher` tinyint(1) NOT NULL,
  `k_name` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `e_id` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `s_nachname` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `s_vorname` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `s_geburtsdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schulform`
--

CREATE TABLE IF NOT EXISTS `schulform` (
  `schf_id` int(11) NOT NULL,
  `schf_zweig` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `schf_modulanforderung` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `unterrichtsfach`
--

CREATE TABLE IF NOT EXISTS `unterrichtsfach` (
  `uf_bezeichnung` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `uf_kurzbezeichnung` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `uf_jahrgang` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `uf_stundenanzahlprowoche` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `unterrichtsstunde`
--

CREATE TABLE IF NOT EXISTS `unterrichtsstunde` (
  `us_id` int(11) NOT NULL,
  `us_std_datum` date NOT NULL,
  `us_stunde` int(11) NOT NULL,
  `us_kurzbezeichnung` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `us_raum` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `us_thema` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `k_name` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `l_lehrerid` int(11) NOT NULL,
  `uf_bezeichnung` varchar(45) COLLATE utf8_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `benutzergruppe` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `benutzergruppe`, `created_at`, `updated_at`) VALUES
(2, 'wolfi', 'RkSB3AeML7EiFnC8xy8ATVb3P5ovImUM', '$2y$13$VLtBjZSAqCfdetR7gdpZ8OIYr8QJNAl7i5cJdiSzCeq50mIu7Ssga', NULL, 'wolfi@asdf.at', 10, 30, 1430087456, 1430087456),
(3, 'lehrerbsp', 'Ap4_MuG5J1tFSd2nihvFZH4vbTCOKKqO', '$2y$13$6rSXb7Jaj8b4Io5CqrV6J.bFBcd0Mj9nxH0Rz3tGHKU0X1NHFN5vy', NULL, 'asdf@sdf.at', 10, 20, 1430660392, 1430660392),
(4, 'schopf', 'eBHN9ESuGj1BmBnCF4jXuUeOR796qF3Y', '$2y$13$mp0eyQvsDEmR4l763Ml0aOAoEG/AU17808cM/8AKAjjUsMTC3Jnz2', NULL, 'schopf@asdf.at', 10, 20, 1430913313, 1430913313);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `abteilung`
--
ALTER TABLE `abteilung`
 ADD PRIMARY KEY (`abt_bezeichnung`), ADD KEY `fk_Abteilung_Lehrer1_idx` (`l_lehrerid`);

--
-- Indizes für die Tabelle `benutzergruppe`
--
ALTER TABLE `benutzergruppe`
 ADD PRIMARY KEY (`bg_id`);

--
-- Indizes für die Tabelle `eltern`
--
ALTER TABLE `eltern`
 ADD PRIMARY KEY (`e_id`), ADD KEY `fk_Eltern_Person1_idx` (`e_nachname`,`e_vorname`,`e_geburtsdatum`);

--
-- Indizes für die Tabelle `fehlstunde`
--
ALTER TABLE `fehlstunde`
 ADD PRIMARY KEY (`fs_datum`), ADD KEY `fk_Fehlstunde_Schueler1_idx` (`s_schuelernummer`), ADD KEY `fk_Fehlstunde_Unterrichtsfach1_idx` (`uf_bezeichnung`);

--
-- Indizes für die Tabelle `klasse`
--
ALTER TABLE `klasse`
 ADD PRIMARY KEY (`k_name`), ADD KEY `fk_Klasse_Abteilung1_idx` (`k_abt_bezeichnung`), ADD KEY `fk_Klasse_Schulform1_idx` (`schf_id`);

--
-- Indizes für die Tabelle `krankmeldung`
--
ALTER TABLE `krankmeldung`
 ADD PRIMARY KEY (`km_id`), ADD KEY `fk_Krankmeldung_Schueler1_idx` (`s_schuelernummer`);

--
-- Indizes für die Tabelle `lehrer`
--
ALTER TABLE `lehrer`
 ADD PRIMARY KEY (`l_lehrerid`), ADD KEY `fk_Lehrer_Person1_idx` (`l_nachname`,`l_vorname`,`l_geburtsdatum`);

--
-- Indizes für die Tabelle `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`m_name`);

--
-- Indizes für die Tabelle `migration`
--
ALTER TABLE `migration`
 ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
 ADD PRIMARY KEY (`p_nachname`,`p_vorname`,`p_geburtsdatum`), ADD KEY `fk_Person_Benutzergruppe1_idx` (`bg_id`);

--
-- Indizes für die Tabelle `pruefung`
--
ALTER TABLE `pruefung`
 ADD PRIMARY KEY (`p_datum`), ADD KEY `fk_Prüfungen_Unterrichtsstunde1_idx` (`uf_id`);

--
-- Indizes für die Tabelle `schueler`
--
ALTER TABLE `schueler`
 ADD PRIMARY KEY (`s_schuelernummer`), ADD KEY `fk_Schueler_Klasse1_idx` (`k_name`), ADD KEY `fk_Schueler_Eltern1_idx` (`e_id`), ADD KEY `fk_Schueler_Person1_idx` (`s_nachname`,`s_vorname`,`s_geburtsdatum`);

--
-- Indizes für die Tabelle `schulform`
--
ALTER TABLE `schulform`
 ADD PRIMARY KEY (`schf_id`);

--
-- Indizes für die Tabelle `unterrichtsfach`
--
ALTER TABLE `unterrichtsfach`
 ADD PRIMARY KEY (`uf_bezeichnung`);

--
-- Indizes für die Tabelle `unterrichtsstunde`
--
ALTER TABLE `unterrichtsstunde`
 ADD PRIMARY KEY (`us_id`), ADD KEY `fk_Unterrichtsstunde_has_Unterrichtsfach_Klasse1_idx` (`k_name`), ADD KEY `fk_Unterrichtsfach in der Unterrichtsstunde_Lehrer1_idx` (`l_lehrerid`), ADD KEY `fk_Unterrichtsstunde_Unterrichtsfach1_idx` (`uf_bezeichnung`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `abteilung`
--
ALTER TABLE `abteilung`
ADD CONSTRAINT `fk_Abteilung_Lehrer1` FOREIGN KEY (`l_lehrerid`) REFERENCES `lehrer` (`l_lehrerid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `eltern`
--
ALTER TABLE `eltern`
ADD CONSTRAINT `fk_Eltern_Person1` FOREIGN KEY (`e_nachname`, `e_vorname`, `e_geburtsdatum`) REFERENCES `person` (`p_nachname`, `p_vorname`, `p_geburtsdatum`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `fehlstunde`
--
ALTER TABLE `fehlstunde`
ADD CONSTRAINT `fk_Fehlstunde_Schueler1` FOREIGN KEY (`s_schuelernummer`) REFERENCES `schueler` (`s_schuelernummer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Fehlstunde_Unterrichtsfach1` FOREIGN KEY (`uf_bezeichnung`) REFERENCES `unterrichtsfach` (`uf_bezeichnung`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `klasse`
--
ALTER TABLE `klasse`
ADD CONSTRAINT `fk_Klasse_Abteilung1` FOREIGN KEY (`k_abt_bezeichnung`) REFERENCES `abteilung` (`abt_bezeichnung`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Klasse_Schulform1` FOREIGN KEY (`schf_id`) REFERENCES `schulform` (`schf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `krankmeldung`
--
ALTER TABLE `krankmeldung`
ADD CONSTRAINT `fk_Krankmeldung_Schueler1` FOREIGN KEY (`s_schuelernummer`) REFERENCES `schueler` (`s_schuelernummer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `lehrer`
--
ALTER TABLE `lehrer`
ADD CONSTRAINT `fk_Lehrer_Person1` FOREIGN KEY (`l_nachname`, `l_vorname`, `l_geburtsdatum`) REFERENCES `person` (`p_nachname`, `p_vorname`, `p_geburtsdatum`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `person`
--
ALTER TABLE `person`
ADD CONSTRAINT `fk_Person_Benutzergruppe1` FOREIGN KEY (`bg_id`) REFERENCES `benutzergruppe` (`bg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `pruefung`
--
ALTER TABLE `pruefung`
ADD CONSTRAINT `fk_Prüfungen_Unterrichtsstunde1` FOREIGN KEY (`uf_id`) REFERENCES `unterrichtsstunde` (`us_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `schueler`
--
ALTER TABLE `schueler`
ADD CONSTRAINT `fk_Schueler_Eltern1` FOREIGN KEY (`e_id`) REFERENCES `eltern` (`e_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Schueler_Klasse1` FOREIGN KEY (`k_name`) REFERENCES `klasse` (`k_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Schueler_Person1` FOREIGN KEY (`s_nachname`, `s_vorname`, `s_geburtsdatum`) REFERENCES `person` (`p_nachname`, `p_vorname`, `p_geburtsdatum`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `unterrichtsstunde`
--
ALTER TABLE `unterrichtsstunde`
ADD CONSTRAINT `fk_Unterrichtsfach in der Unterrichtsstunde_Lehrer1` FOREIGN KEY (`l_lehrerid`) REFERENCES `lehrer` (`l_lehrerid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Unterrichtsstunde_Unterrichtsfach1` FOREIGN KEY (`uf_bezeichnung`) REFERENCES `unterrichtsfach` (`uf_bezeichnung`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Unterrichtsstunde_has_Unterrichtsfach_Klasse1` FOREIGN KEY (`k_name`) REFERENCES `klasse` (`k_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
