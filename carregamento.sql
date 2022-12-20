USE banco_trabalho02;

-- Decidimos por utilizar variáveis para simplificar o desenvolvimento de depuração do script de carregamento.
-- Tal prática evita a utilização dos chamados 'valores mágicos' pelo código.
--
-- A sintaxe pode ser consultada em https://learn.microsoft.com/en-us/sql/t-sql/language-elements/variables-transact-sql?view=sql-server-ver16
DECLARE
	@abertura INT,
	@deposito INT,
	@levantamento INT,
	@transferencia INT,
	@fecho INT;

SET @abertura = 1;
SET @deposito = 2;
SET @levantamento = 3;
SET @transferencia = 4;
SET @fecho = 5;

SET IDENTITY_INSERT TipoMovimento ON;

INSERT INTO TipoMovimento
	(codigo, descricao)
VALUES
	(@abertura, 'Abertura'),
	(@deposito, 'Depósito'),
	(@levantamento, 'Levantamento'),
	(@transferencia, 'Transferência'),
	(@fecho, 'Fecho');

SET IDENTITY_INSERT TipoMovimento OFF;

INSERT INTO Pais
	(nome, sigla)
VALUES
	('Afghanistan', 'AF'),
	('Åland Islands', 'AX'),
	('Albania', 'AL'),
	('Algeria', 'DZ'),
	('American Samoa', 'AS'),
	('Andorra', 'AD'),
	('Angola', 'AO'),
	('Anguilla', 'AI'),
	('Antarctica', 'AQ'),
	('Antigua and Barbuda', 'AG'),
	('Argentina', 'AR'),
	('Armenia', 'AM'),
	('Aruba', 'AW'),
	('Australia', 'AU'),
	('Austria', 'AT'),
	('Azerbaijan', 'AZ'),
	('Bahamas', 'BS'),
	('Bahrain', 'BH'),
	('Bangladesh', 'BD'),
	('Barbados', 'BB'),
	('Belarus', 'BY'),
	('Belgium', 'BE'),
	('Belize', 'BZ'),
	('Benin', 'BJ'),
	('Bermuda', 'BM'),
	('Bhutan', 'BT'),
	('Bolivia (Plurinational State of)', 'BO'),
	('Bonaire, Sint Eustatius and Saba', 'BQ'),
	('Bosnia and Herzegovina', 'BA'),
	('Botswana', 'BW'),
	('Bouvet Island', 'BV'),
	('Brazil', 'BR'),
	('British Indian Ocean Territory', 'IO'),
	('Brunei Darussalam', 'BN'),
	('Bulgaria', 'BG'),
	('Burkina Faso', 'BF'),
	('Burundi', 'BI'),
	('Cabo Verde', 'CV'),
	('Cambodia', 'KH'),
	('Cameroon', 'CM'),
	('Canada', 'CA'),
	('Cayman Islands', 'KY'),
	('Central African Republic', 'CF'),
	('Chad', 'TD'),
	('Chile', 'CL'),
	('China', 'CN'),
	('Christmas Island', 'CX'),
	('Cocos (Keeling) Islands', 'CC'),
	('Colombia', 'CO'),
	('Comoros', 'KM'),
	('Congo', 'CG'),
	('Congo, Democratic Republic of the', 'CD'),
	('Cook Islands', 'CK'),
	('Costa Rica', 'CR'),
	('Côte d''Ivoire', 'CI'),
	('Croatia', 'HR'),
	('Cuba', 'CU'),
	('Curaçao', 'CW'),
	('Cyprus', 'CY'),
	('Czechia', 'CZ'),
	('Denmark', 'DK'),
	('Djibouti', 'DJ'),
	('Dominica', 'DM'),
	('Dominican Republic', 'DO'),
	('Ecuador', 'EC'),
	('Egypt', 'EG'),
	('El Salvador', 'SV'),
	('Equatorial Guinea', 'GQ'),
	('Eritrea', 'ER'),
	('Estonia', 'EE'),
	('Eswatini', 'SZ'),
	('Ethiopia', 'ET'),
	('Falkland Islands (Malvinas)', 'FK'),
	('Faroe Islands', 'FO'),
	('Fiji', 'FJ'),
	('Finland', 'FI'),
	('France', 'FR'),
	('French Guiana', 'GF'),
	('French Polynesia', 'PF'),
	('French Southern Territories', 'TF'),
	('Gabon', 'GA'),
	('Gambia', 'GM'),
	('Georgia', 'GE'),
	('Germany', 'DE'),
	('Ghana', 'GH'),
	('Gibraltar', 'GI'),
	('Greece', 'GR'),
	('Greenland', 'GL'),
	('Grenada', 'GD'),
	('Guadeloupe', 'GP'),
	('Guam', 'GU'),
	('Guatemala', 'GT'),
	('Guernsey', 'GG'),
	('Guinea', 'GN'),
	('Guinea-Bissau', 'GW'),
	('Guyana', 'GY'),
	('Haiti', 'HT'),
	('Heard Island and McDonald Islands', 'HM'),
	('Holy See', 'VA'),
	('Honduras', 'HN'),
	('Hong Kong', 'HK'),
	('Hungary', 'HU'),
	('Iceland', 'IS'),
	('India', 'IN'),
	('Indonesia', 'ID'),
	('Iran (Islamic Republic of)', 'IR'),
	('Iraq', 'IQ'),
	('Ireland', 'IE'),
	('Isle of Man', 'IM'),
	('Israel', 'IL'),
	('Italy', 'IT'),
	('Jamaica', 'JM'),
	('Japan', 'JP'),
	('Jersey', 'JE'),
	('Jordan', 'JO'),
	('Kazakhstan', 'KZ'),
	('Kenya', 'KE'),
	('Kiribati', 'KI'),
	('Korea (Democratic People''s Republic of)', 'KP'),
	('Korea, Republic of', 'KR'),
	('Kuwait', 'KW'),
	('Kyrgyzstan', 'KG'),
	('Lao People''s Democratic Republic', 'LA'),
	('Latvia', 'LV'),
	('Lebanon', 'LB'),
	('Lesotho', 'LS'),
	('Liberia', 'LR'),
	('Libya', 'LY'),
	('Liechtenstein', 'LI'),
	('Lithuania', 'LT'),
	('Luxembourg', 'LU'),
	('Macao', 'MO'),
	('Madagascar', 'MG'),
	('Malawi', 'MW'),
	('Malaysia', 'MY'),
	('Maldives', 'MV'),
	('Mali', 'ML'),
	('Malta', 'MT'),
	('Marshall Islands', 'MH'),
	('Martinique', 'MQ'),
	('Mauritania', 'MR'),
	('Mauritius', 'MU'),
	('Mayotte', 'YT'),
	('Mexico', 'MX'),
	('Micronesia (Federated States of)', 'FM'),
	('Moldova, Republic of', 'MD'),
	('Monaco', 'MC'),
	('Mongolia', 'MN'),
	('Montenegro', 'ME'),
	('Montserrat', 'MS'),
	('Morocco', 'MA'),
	('Mozambique', 'MZ'),
	('Myanmar', 'MM'),
	('Namibia', 'NA'),
	('Nauru', 'NR'),
	('Nepal', 'NP'),
	('Netherlands', 'NL'),
	('New Caledonia', 'NC'),
	('New Zealand', 'NZ'),
	('Nicaragua', 'NI'),
	('Niger', 'NE'),
	('Nigeria', 'NG'),
	('Niue', 'NU'),
	('Norfolk Island', 'NF'),
	('North Macedonia', 'MK'),
	('Northern Mariana Islands', 'MP'),
	('Norway', 'NO'),
	('Oman', 'OM'),
	('Pakistan', 'PK'),
	('Palau', 'PW'),
	('Palestine, State of', 'PS'),
	('Panama', 'PA'),
	('Papua New Guinea', 'PG'),
	('Paraguay', 'PY'),
	('Peru', 'PE'),
	('Philippines', 'PH'),
	('Pitcairn', 'PN'),
	('Poland', 'PL'),
	('Portugal', 'PT'),
	('Puerto Rico', 'PR'),
	('Qatar', 'QA'),
	('Réunion', 'RE'),
	('Romania', 'RO'),
	('Russian Federation', 'RU'),
	('Rwanda', 'RW'),
	('Saint Barthélemy', 'BL'),
	('Saint Helena, Ascension and Tristan da Cunha', 'SH'),
	('Saint Kitts and Nevis', 'KN'),
	('Saint Lucia', 'LC'),
	('Saint Martin (French part)', 'MF'),
	('Saint Pierre and Miquelon', 'PM'),
	('Saint Vincent and the Grenadines', 'VC'),
	('Samoa', 'WS'),
	('San Marino', 'SM'),
	('Sao Tome and Principe', 'ST'),
	('Saudi Arabia', 'SA'),
	('Senegal', 'SN'),
	('Serbia', 'RS'),
	('Seychelles', 'SC'),
	('Sierra Leone', 'SL'),
	('Singapore', 'SG'),
	('Sint Maarten (Dutch part)', 'SX'),
	('Slovakia', 'SK'),
	('Slovenia', 'SI'),
	('Solomon Islands', 'SB'),
	('Somalia', 'SO'),
	('South Africa', 'ZA'),
	('South Georgia and the South Sandwich Islands', 'GS'),
	('South Sudan', 'SS'),
	('Spain', 'ES'),
	('Sri Lanka', 'LK'),
	('Sudan', 'SD'),
	('Suriname', 'SR'),
	('Svalbard and Jan Mayen', 'SJ'),
	('Sweden', 'SE'),
	('Switzerland', 'CH'),
	('Syrian Arab Republic', 'SY'),
	('Taiwan, Province of China', 'TW'),
	('Tajikistan', 'TJ'),
	('Tanzania, United Republic of', 'TZ'),
	('Thailand', 'TH'),
	('Timor-Leste', 'TL'),
	('Togo', 'TG'),
	('Tokelau', 'TK'),
	('Tonga', 'TO'),
	('Trinidad and Tobago', 'TT'),
	('Tunisia', 'TN'),
	('Türkiye', 'TR'),
	('Turkmenistan', 'TM'),
	('Turks and Caicos Islands', 'TC'),
	('Tuvalu', 'TV'),
	('Uganda', 'UG'),
	('Ukraine', 'UA'),
	('United Arab Emirates', 'AE'),
	('United Kingdom of Great Britain and Northern Ireland', 'GB'),
	('United States Minor Outlying Islands', 'UM'),
	('United States of America', 'US'),
	('Uruguay', 'UY'),
	('Uzbekistan', 'UZ'),
	('Vanuatu', 'VU'),
	('Venezuela (Bolivarian Republic of)', 'VE'),
	('Viet Nam', 'VN'),
	('Virgin Islands (British)', 'VG'),
	('Virgin Islands (U.S.)', 'VI'),
	('Wallis and Futuna', 'WF'),
	('Western Sahara', 'EH'),
	('Yemen', 'YE'),
	('Zambia', 'ZM'),
	('Zimbabwe', 'ZW');

DECLARE
	@nif_cruz_oliveira CHAR(9),
	@nif_nuno_maduro CHAR(9),
	@nif_cruz_lopes CHAR(9),
	@nif_teresinha_fernandes CHAR(9),
	@nif_paula_cristina CHAR(9),
	@nif_eliott_wintaker CHAR(9),
	@nif_diego_nogueira CHAR(9),
	@nif_bela_swan CHAR(9),
	@nif_cristiano_ronaldo CHAR(9),
	@nif_lionel_messi CHAR(9),
	@nif_neymar_junior CHAR(9),
	@nif_marta_alencar CHAR(9),
	@nif_penélope_cruz CHAR(9),
	@nif_junji_ito CHAR(9),
	@nif_yukito_harumo CHAR(9),
	@nif_lopes_lopes CHAR(9);

SET @nif_cruz_oliveira = '275751821';
SET @nif_nuno_maduro = '312515634';
SET @nif_cruz_lopes = '200942905';
SET @nif_teresinha_fernandes = '207322376';
SET @nif_paula_cristina = '187860319';
SET @nif_eliott_wintaker = '115780661';
SET @nif_diego_nogueira = '318460106';
SET @nif_bela_swan = '368636348';
SET @nif_cristiano_ronaldo = '334462169';
SET @nif_lionel_messi = '150391080';
SET @nif_neymar_junior = '145015211';
SET @nif_marta_alencar = '126007764';
SET @nif_penélope_cruz = '161841830';
SET @nif_junji_ito = '280366337';
SET @nif_yukito_harumo = '259643939';
SET @nif_lopes_lopes = '330021680';

INSERT INTO Cliente
	(nif, pnome, unome, siglaPais)
VALUES
	(@nif_cruz_oliveira, 'Cruz', 'Oliveira', 'PT'),
	(@nif_nuno_maduro, 'Nuno', 'Maduro', 'PT'),
	(@nif_cruz_lopes, 'Cruz', 'Lopes', 'PT'),
	(@nif_teresinha_fernandes, 'Teresinha', 'Fernandes', 'PT'),
	(@nif_paula_cristina, 'Paula', 'Cristina', 'BR'),
	(@nif_eliott_wintaker, 'Eliott', 'Wintaker', 'GB'),
	(@nif_diego_nogueira, 'Diego', 'Nogueira', 'BR'),
	(@nif_bela_swan, 'Bela', 'Swan', 'US'),
	(@nif_cristiano_ronaldo, 'Cristiano', 'Ronaldo', 'PT'),
	(@nif_lionel_messi, 'Lionel', 'Messi', 'AR'),
	(@nif_neymar_junior, 'Neymar', 'Junior', 'BR'),
	(@nif_marta_alencar, 'Marta', 'Alencar', 'PT'),
	(@nif_penélope_cruz, 'Penélope', 'Cruz', 'ES'),
	(@nif_junji_ito, 'Junji', 'Ito', 'JP'),
	(@nif_yukito_harumo, 'Yukito', 'Harumo', 'JP'),
	(@nif_lopes_lopes, 'Lopes', 'Lopes', 'JP');

SET IDENTITY_INSERT Banco ON;

INSERT INTO Banco
	(idBanco, designacao, siglaPais)
VALUES
	(1, 'Montepio', 'PT'),
	(2, 'Novobanco', 'PT'),
	(3, 'HSBC', 'GB'),
	(4, 'Banco do Brasil', 'BR'),
	(5, 'Caixa econômica federal', 'BR');

SET IDENTITY_INSERT Banco OFF;

DECLARE
	@nib_cruz_lopes CHAR(21),
	@nib_cruz_nuno CHAR(21),
	@nib_cris_lio_ney CHAR(21),
	@nib_yukito CHAR(21),
	@nib_pen_eli CHAR(21),
	@nib_diego_bela CHAR(21),
	@nib_teresinha_paula_junji CHAR(21);

SET @nib_cruz_lopes = '000797146036367373085';
SET @nib_cruz_nuno = '001015598667719520886';
SET @nib_cris_lio_ney = '003327533462356732426';
SET @nib_yukito = '003329601584654222915';
SET @nib_pen_eli = '003366156899261865171';
SET @nib_diego_bela = '000757919819185222959';
SET @nib_teresinha_paula_junji = '001877810137033507747';

DECLARE
	@eur_2_000 MONEY,
	@eur_3_000 MONEY,
	@eur_5_000 MONEY,
	@eur_10_000 MONEY,
	@eur_1_000_000 MONEY,
	@eur_2_000_000 MONEY;

SET @eur_2_000 = 2000;
SET @eur_3_000 = 3000;
SET @eur_5_000 = 5000;
SET @eur_10_000 = 10000;
SET @eur_1_000_000 = 1000000;
SET @eur_2_000_000 = 2000000;

-- Aberturas de contas
-- *******************
-- Abertura de Conta de
--
-- - Cruz Lopes
-- - Lopes Lopes
--
-- 2 titular
INSERT INTO Conta
	(nib, saldo, dataAbertura, idBancoConta)
VALUES
	(@nib_cruz_lopes, 0, '2022-01-02', 1);

INSERT INTO Titular
	(nifCliente, nibConta, ordem)
VALUES
	(@nif_cruz_lopes, @nib_cruz_lopes, 1),
	(@nif_lopes_lopes, @nib_cruz_lopes, 2);

INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_lopes, @nib_cruz_lopes, @abertura, '2022-01-02T12:12:12', 0);

-- Abertura de Conta de
--
-- - Cruz Oliveira
-- - Nuno Maduro
--
-- 2 titulares
INSERT INTO Conta
	(nib, saldo, dataAbertura, idBancoConta)
VALUES
	(@nib_cruz_nuno, 0, '2022-01-03', 2);

INSERT INTO Titular
	(nifCliente, nibConta, ordem)
VALUES
	(@nif_cruz_oliveira, @nib_cruz_nuno, 1),
	(@nif_nuno_maduro, @nib_cruz_nuno, 2);

INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_nuno, @nib_cruz_nuno, @abertura, '2022-01-03T13:13:13', 0);

-- Abertura de Conta de
--
-- - Cristiano Ronaldo
-- - Lionel Messi
-- - Neymar Junior
--
-- 3 titulares
INSERT INTO Conta
	(nib, saldo, dataAbertura, idBancoConta)
VALUES
	(@nib_cris_lio_ney, 0, '2022-01-04', 3);

INSERT INTO Titular
	(nifCliente, nibConta, ordem)
VALUES
	(@nif_cristiano_ronaldo, @nib_cris_lio_ney, 1),
	(@nif_lionel_messi, @nib_cris_lio_ney, 2),
	(@nif_neymar_junior, @nib_cris_lio_ney, 3);

INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cris_lio_ney, @nib_cris_lio_ney, @abertura, '2022-01-04T14:14:14', 0);

-- Abertura de Conta de
--
-- - Yukito Harumo
--
-- 1 titular
INSERT INTO Conta
	(nib, saldo, dataAbertura, idBancoConta)
VALUES
	(@nib_yukito, 0, '2022-01-05', 4);

INSERT INTO Titular
	(nifCliente, nibConta, ordem)
VALUES
	(@nif_yukito_harumo, @nib_yukito, 1);

INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_yukito, @nib_yukito, @abertura, '2022-01-05T15:15:15', 0);

-- Abertura de Conta de
--
-- - Penélope Cruz
-- - Eliott Wintaker
--
-- 2 titulares
INSERT INTO Conta
	(nib, saldo, dataAbertura, idBancoConta)
VALUES
	(@nib_pen_eli, 0, '2022-01-06', 5);

INSERT INTO Titular
	(nifCliente, nibConta, ordem)
VALUES
	(@nif_penélope_cruz, @nib_pen_eli, 1),
	(@nif_eliott_wintaker, @nib_pen_eli, 2);

INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_pen_eli, @nib_pen_eli, @abertura, '2022-01-06T16:16:16', 0);

-- Abertura de Conta de
--
-- - Diego Nogueira
-- - Bela Swan
--
-- 2 titulares
INSERT INTO Conta
	(nib, saldo, dataAbertura, idBancoConta)
VALUES
	(@nib_diego_bela, 0, '2022-01-06', 5);

INSERT INTO Titular
	(nifCliente, nibConta, ordem)
VALUES
	(@nif_diego_nogueira, @nib_diego_bela, 1),
	(@nif_bela_swan, @nib_diego_bela, 2);

INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_diego_bela, @nib_diego_bela, @abertura, '2022-01-06T16:16:16', 0);

-- Abertura de Conta de
--
-- - Teresinha Fernandes
-- - Paula Cristina
-- - Junji Ito
--
-- 3 titulares
INSERT INTO Conta
	(nib, saldo, dataAbertura, idBancoConta)
VALUES
	(@nib_teresinha_paula_junji, 0, '2022-01-04', 3);

INSERT INTO Titular
	(nifCliente, nibConta, ordem)
VALUES
	(@nif_teresinha_fernandes, @nib_teresinha_paula_junji, 1),
	(@nif_paula_cristina, @nib_teresinha_paula_junji, 2),
	(@nif_junji_ito, @nib_teresinha_paula_junji, 3);

INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_teresinha_paula_junji, @nib_teresinha_paula_junji, @abertura, '2022-01-04T14:14:14', 0);

-- Depósito de
--
-- - Cristiano Ronaldo
-- - Lionel Messi
-- - Neymar Junior
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino,codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cris_lio_ney, @nib_cris_lio_ney, @deposito, '2022-02-01T11:11:11', @eur_1_000_000);

UPDATE Conta
SET saldo = saldo + @eur_1_000_000
WHERE nib = @nib_cris_lio_ney;

-- Depósito de
--
-- - Cristiano Ronaldo
-- - Lionel Messi
-- - Neymar Junior
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino,codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cris_lio_ney, @nib_cris_lio_ney, @deposito, '2022-02-01T11:11:11', @eur_2_000);

UPDATE Conta
SET saldo = saldo + @eur_2_000
WHERE nib = @nib_cris_lio_ney;

-- Levantamento de
--
-- - Cristiano Ronaldo
-- - Lionel Messi
-- - Neymar Junior
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cris_lio_ney, @nib_cris_lio_ney, @levantamento, '2022-03-01T11:11:11', @eur_10_000);

UPDATE Conta
SET saldo = saldo - @eur_10_000
WHERE nib = @nib_cris_lio_ney

-- Transferência de
--
-- - Cristiano Ronaldo
-- - Lionel Messi
-- - Neymar Junior
--
-- Para
--
-- - Cruz Lopes
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cris_lio_ney, @nib_cris_lio_ney, @transferencia, '2022-04-01T14:14:14', @eur_5_000);

-- Débito na conta de origem (Cristiano, Lionel e Neymar)
UPDATE Conta
SET saldo = saldo - @eur_5_000
WHERE nib = @nib_cris_lio_ney;

-- Crédito na conta de destino (Cruz Lopes)
UPDATE Conta
SET saldo = saldo + @eur_5_000
WHERE nib = @nib_cruz_lopes;

-- Depósito de
--
-- - Penélope Cruz
-- - Eliott Wintaker
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino,codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_pen_eli, @nib_pen_eli, @deposito, '2022-02-02T12:12:12', @eur_2_000_000);

UPDATE Conta
SET saldo = saldo + @eur_2_000_000
WHERE nib = @nib_pen_eli;

-- Transferência de
--
-- - Penélope Cruz
-- - Eliott Wintaker
--
-- Para
--
-- - Yukito Harumo
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_pen_eli, @nib_yukito, @transferencia, '2022-03-03T13:13:13', @eur_10_000);

-- Débito na conta de origem (Penélope e Eliott)
UPDATE Conta
SET saldo = saldo - @eur_10_000
WHERE nib = @nib_pen_eli;

-- Crédito na conta de destino (Yukito)
UPDATE Conta
SET saldo = saldo + @eur_10_000
WHERE nib = @nib_yukito;

-- Levantamento de
--
-- - Penélope Cruz
-- - Eliott Wintaker
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_pen_eli, @nib_pen_eli, @levantamento, '2022-04-04T14:14:14', @eur_1_000_000);

UPDATE Conta
SET saldo = saldo - @eur_1_000_000
WHERE nib = @nib_pen_eli;

-- Levantamento de
--
-- - Penélope Cruz
-- - Eliott Wintaker
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_pen_eli, @nib_pen_eli, @levantamento, '2022-04-04T14:14:14', @eur_10_000);

UPDATE Conta
SET saldo = saldo - @eur_10_000
WHERE nib = @nib_pen_eli;

-- Depósito de
--
-- - Cruz Lopes
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino,codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_lopes, @nib_cruz_lopes, @deposito, '2022-02-02T12:12:12', @eur_5_000);

UPDATE Conta
SET saldo = saldo + @eur_5_000
WHERE nib = @nib_cruz_lopes;

-- Depósito de
--
-- - Cruz Lopes
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino,codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_lopes, @nib_cruz_lopes, @deposito, '2022-02-02T12:12:12', @eur_2_000);

UPDATE Conta
SET saldo = saldo + @eur_2_000
WHERE nib = @nib_cruz_lopes;

-- Transferência de
--
-- - Cruz Lopes
--
-- Para
--
-- - Yukito Harumo
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_lopes, @nib_yukito, @transferencia, '2022-03-03T13:13:13', @eur_2_000);

-- Débito na conta de origem (Cruz Lopes)
UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_cruz_lopes;

-- Crédito na conta de destino (Yukito)
UPDATE Conta
SET saldo = saldo + @eur_2_000
WHERE nib = @nib_yukito;

-- Levantamento de
--
-- - Cruz Lopes
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_lopes, @nib_cruz_lopes, @levantamento, '2022-04-04T14:14:14', @eur_3_000);

UPDATE Conta
SET saldo = saldo - @eur_3_000
WHERE nib = @nib_cruz_lopes;

-- Depósito de
--
-- - Cruz Oliveira
-- - Nuno Maduro
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino,codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_nuno, @nib_cruz_nuno, @deposito, '2022-02-03T13:13:13', @eur_5_000);

UPDATE Conta
SET saldo = saldo + @eur_5_000
WHERE nib = @nib_cruz_nuno;

-- Transferência de
--
-- - Cruz Oliveira
-- - Nuno Maduro
--
-- Para
--
-- - Yukito Harumo
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_nuno, @nib_yukito, @transferencia, '2022-03-05T15:15:15', @eur_2_000);

-- Débito na conta de origem (Cruz Lopes)
UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_cruz_nuno;

-- Crédito na conta de destino (Yukito)
UPDATE Conta
SET saldo = saldo + @eur_2_000
WHERE nib = @nib_yukito;

-- Levantamento de
--
-- - Cruz Oliveira
-- - Nuno Maduro
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_nuno, @nib_cruz_nuno, @levantamento, '2022-04-06T16:16:16', @eur_2_000);

UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_cruz_nuno;

-- Fecho de conta de
--
-- - Cruz Oliveira
-- - Nuno Maduro
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_cruz_nuno, @nib_cruz_nuno, @fecho, '2022-07-22T12:12:12', -(SELECT saldo
		FROM Conta
		WHERE nib = @nib_cruz_nuno));

UPDATE Conta
SET dataFecho = '2022-07-22', saldo = saldo - saldo
WHERE nib = @nib_cruz_nuno;

-- Depósito de
--
-- - Yukito Harumo
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino,codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_yukito, @nib_yukito, @deposito, '2022-02-02T15:15:15', @eur_5_000);

UPDATE Conta
SET saldo = saldo + @eur_2_000
WHERE nib = @nib_yukito;

-- Transferência de
--
-- - Yukito Harumo
--
-- Para
--
-- - Cruz Lopes
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_yukito, @nib_cruz_lopes, @transferencia, '2022-03-03T14:14:14', @eur_2_000);

-- Débito na conta de origem (Cruz Lopes)
UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_yukito;

-- Crédito na conta de destino (Yukito)
UPDATE Conta
SET saldo = saldo + @eur_2_000
WHERE nib = @nib_cruz_lopes;

-- Levantamento de
--
-- - Yukito Harumo
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_yukito, @nib_yukito, @levantamento, '2022-04-04T13:13:13', @eur_2_000);

UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_yukito;

-- Fecho de conta de
--
-- - Yukito Harumo
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_yukito, @nib_yukito, @fecho, '2022-07-22T12:12:12', -(SELECT saldo
		FROM Conta
		WHERE nib = @nib_yukito));

UPDATE Conta
SET dataFecho = '2022-07-22', saldo = saldo - saldo
WHERE nib = @nib_yukito;

-- Depósito de
--
-- - Diego Nogueira
-- - Bela Swan
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino,codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_diego_bela, @nib_diego_bela, @deposito, '2022-02-02T15:15:15', @eur_10_000);

UPDATE Conta
SET saldo = saldo + @eur_10_000
WHERE nib = @nib_diego_bela;

-- Transferência de
--
-- - Diego Nogueira
-- - Bela Swan
--
-- Para
--
-- - Cruz Lopes
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_diego_bela, @nib_cruz_lopes, @transferencia, '2022-03-03T14:14:14', @eur_2_000);

-- Débito na conta de origem (Cruz Lopes)
UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_diego_bela;

-- Crédito na conta de destino (Yukito)
UPDATE Conta
SET saldo = saldo + @eur_2_000
WHERE nib = @nib_cruz_lopes;

-- Levantamento de
--
-- - Diego Nogueira
-- - Bela Swan
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_diego_bela, @nib_diego_bela, @levantamento, '2022-04-04T13:13:13', @eur_2_000);

UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_diego_bela;

-- Levantamento de
--
-- - Diego Nogueira
-- - Bela Swan
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_diego_bela, @nib_diego_bela, @levantamento, '2022-04-04T13:13:13', @eur_2_000);

UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_diego_bela;

-- Depósito de
--
-- - Teresinha Fernandes
-- - Paula Cristina
-- - Junji Ito
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino,codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_teresinha_paula_junji, @nib_teresinha_paula_junji, @deposito, '2022-02-02T15:15:15', @eur_10_000);

UPDATE Conta
SET saldo = saldo + @eur_10_000
WHERE nib = @nib_teresinha_paula_junji;

-- Transferência de
--
-- - Teresinha Fernandes
-- - Paula Cristina
-- - Junji Ito
--
-- Para
--
-- - Cruz Lopes
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_teresinha_paula_junji, @nib_cruz_lopes, @transferencia, '2022-03-03T14:14:14', @eur_2_000);

-- Débito na conta de origem (Cruz Lopes)
UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_teresinha_paula_junji;

-- Crédito na conta de destino (Yukito)
UPDATE Conta
SET saldo = saldo + @eur_2_000
WHERE nib = @nib_cruz_lopes;

-- Levantamento de
--
-- - Teresinha Fernandes
-- - Paula Cristina
-- - Junji Ito
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_teresinha_paula_junji, @nib_teresinha_paula_junji, @levantamento, '2022-04-04T13:13:13', @eur_2_000);

UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_teresinha_paula_junji;

-- Levantamento de
--
-- - Teresinha Fernandes
-- - Paula Cristina
-- - Junji Ito
--
INSERT INTO Movimento
	(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora, quantia)
VALUES
	(@nib_teresinha_paula_junji, @nib_teresinha_paula_junji, @levantamento, '2022-04-04T13:13:13', @eur_2_000);

UPDATE Conta
SET saldo = saldo - @eur_2_000
WHERE nib = @nib_teresinha_paula_junji;
