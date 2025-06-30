import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.g.dart';

@JsonEnum(alwaysCreate: true)
enum Country {
  @JsonValue(0)
  afghanistan,

  @JsonValue(1)
  alandIslands,

  @JsonValue(2)
  albania,

  @JsonValue(3)
  algeria,

  @JsonValue(4)
  andorra,

  @JsonValue(5)
  angola,

  @JsonValue(6)
  antiguaAndBarbuda,

  @JsonValue(7)
  argentina,

  @JsonValue(8)
  armenia,

  @JsonValue(9)
  australia,

  @JsonValue(10)
  austria,

  @JsonValue(11)
  azerbaijan,

  @JsonValue(12)
  bahamas,

  @JsonValue(13)
  bahrain,

  @JsonValue(14)
  bangladesh,

  @JsonValue(15)
  barbados,

  @JsonValue(16)
  belarus,

  @JsonValue(17)
  belgium,

  @JsonValue(18)
  belize,

  @JsonValue(19)
  benin,

  @JsonValue(20)
  bhutan,

  @JsonValue(21)
  bolivia,

  @JsonValue(22)
  bosniaAndHerzegovina,

  @JsonValue(23)
  botswana,

  @JsonValue(24)
  brazil,

  @JsonValue(25)
  brunei,

  @JsonValue(26)
  bulgaria,

  @JsonValue(27)
  burkinaFaso,

  @JsonValue(28)
  burundi,

  @JsonValue(29)
  caboVerde,

  @JsonValue(30)
  cambodia,

  @JsonValue(31)
  cameroon,

  @JsonValue(32)
  canada,

  @JsonValue(33)
  centralAfricanRepublic,

  @JsonValue(34)
  chad,

  @JsonValue(35)
  chile,

  @JsonValue(36)
  china,

  @JsonValue(37)
  colombia,

  @JsonValue(38)
  comoros,

  @JsonValue(39)
  congo, // Congo (Congo-Brazzaville)

  @JsonValue(40)
  costaRica,

  @JsonValue(41)
  croatia,

  @JsonValue(42)
  cuba,

  @JsonValue(43)
  cyprus,

  @JsonValue(44)
  czechia, // Czechia (Czech Republic)

  @JsonValue(45)
  democraticRepublicOfTheCongo,

  @JsonValue(46)
  denmark,

  @JsonValue(47)
  djibouti,

  @JsonValue(48)
  dominica,

  @JsonValue(49)
  dominicanRepublic,

  @JsonValue(50)
  ecuador,

  @JsonValue(51)
  egypt,

  @JsonValue(52)
  elSalvador,

  @JsonValue(53)
  equatorialGuinea,

  @JsonValue(54)
  eritrea,

  @JsonValue(55)
  estonia,

  @JsonValue(56)
  eswatini, // formerly Swaziland

  @JsonValue(57)
  ethiopia,

  @JsonValue(58)
  fiji,

  @JsonValue(59)
  finland,

  @JsonValue(60)
  france,

  @JsonValue(61)
  gabon,

  @JsonValue(62)
  gambia,

  @JsonValue(63)
  georgia,

  @JsonValue(64)
  germany,

  @JsonValue(65)
  ghana,

  @JsonValue(66)
  greece,

  @JsonValue(67)
  grenada,

  @JsonValue(68)
  guatemala,

  @JsonValue(69)
  guinea,

  @JsonValue(70)
  guineaBissau,

  @JsonValue(71)
  guyana,

  @JsonValue(72)
  haiti,

  @JsonValue(73)
  honduras,

  @JsonValue(74)
  hungary,

  @JsonValue(75)
  iceland,

  @JsonValue(76)
  india,

  @JsonValue(77)
  indonesia,

  @JsonValue(78)
  iran,

  @JsonValue(79)
  iraq,

  @JsonValue(80)
  ireland,

  @JsonValue(81)
  israel,

  @JsonValue(82)
  italy,

  @JsonValue(83)
  jamaica,

  @JsonValue(84)
  japan,

  @JsonValue(85)
  jordan,

  @JsonValue(86)
  kazakhstan,

  @JsonValue(87)
  kenya,

  @JsonValue(88)
  kiribati,

  @JsonValue(89)
  kuwait,

  @JsonValue(90)
  kyrgyzstan,

  @JsonValue(91)
  laos,

  @JsonValue(92)
  latvia,

  @JsonValue(93)
  lebanon,

  @JsonValue(94)
  lesotho,

  @JsonValue(95)
  liberia,

  @JsonValue(96)
  libya,

  @JsonValue(97)
  liechtenstein,

  @JsonValue(98)
  lithuania,

  @JsonValue(99)
  luxembourg,

  @JsonValue(100)
  madagascar,

  @JsonValue(101)
  malawi,

  @JsonValue(102)
  malaysia,

  @JsonValue(103)
  maldives,

  @JsonValue(104)
  mali,

  @JsonValue(105)
  malta,

  @JsonValue(106)
  marshallIslands,

  @JsonValue(107)
  mauritania,

  @JsonValue(108)
  mauritius,

  @JsonValue(109)
  mexico,

  @JsonValue(110)
  micronesia,

  @JsonValue(111)
  moldova,

  @JsonValue(112)
  monaco,

  @JsonValue(113)
  mongolia,

  @JsonValue(114)
  montenegro,

  @JsonValue(115)
  morocco,

  @JsonValue(116)
  mozambique,

  @JsonValue(117)
  myanmar, // formerly Burma

  @JsonValue(118)
  namibia,

  @JsonValue(119)
  nauru,

  @JsonValue(120)
  nepal,

  @JsonValue(121)
  netherlands,

  @JsonValue(122)
  newZealand,

  @JsonValue(123)
  nicaragua,

  @JsonValue(124)
  niger,

  @JsonValue(125)
  nigeria,

  @JsonValue(126)
  northKorea,

  @JsonValue(127)
  northMacedonia, // formerly Macedonia

  @JsonValue(128)
  norway,

  @JsonValue(129)
  oman,

  @JsonValue(130)
  pakistan,

  @JsonValue(131)
  palau,

  @JsonValue(132)
  palestine, // Palestine State

  @JsonValue(133)
  panama,

  @JsonValue(134)
  papuaNewGuinea,

  @JsonValue(135)
  paraguay,

  @JsonValue(136)
  peru,

  @JsonValue(137)
  philippines,

  @JsonValue(138)
  poland,

  @JsonValue(139)
  portugal,

  @JsonValue(140)
  qatar,

  @JsonValue(141)
  romania,

  @JsonValue(142)
  russia,

  @JsonValue(143)
  rwanda,

  @JsonValue(144)
  saintKittsAndNevis,

  @JsonValue(145)
  saintLucia,

  @JsonValue(146)
  saintVincentAndTheGrenadines,

  @JsonValue(147)
  samoa,

  @JsonValue(148)
  sanMarino,

  @JsonValue(149)
  saoTomeAndPrincipe,

  @JsonValue(150)
  saudiArabia,

  @JsonValue(151)
  senegal,

  @JsonValue(152)
  serbia,

  @JsonValue(153)
  seychelles,

  @JsonValue(154)
  sierraLeone,

  @JsonValue(155)
  singapore,

  @JsonValue(156)
  slovakia,

  @JsonValue(157)
  slovenia,

  @JsonValue(158)
  solomonIslands,

  @JsonValue(159)
  somalia,

  @JsonValue(160)
  southAfrica,

  @JsonValue(161)
  southKorea,

  @JsonValue(162)
  southSudan,

  @JsonValue(163)
  spain,

  @JsonValue(164)
  sriLanka,

  @JsonValue(165)
  sudan,

  @JsonValue(166)
  suriname,

  @JsonValue(167)
  sweden,

  @JsonValue(168)
  switzerland,

  @JsonValue(169)
  syria,

  @JsonValue(170)
  tajikistan,

  @JsonValue(171)
  tanzania,

  @JsonValue(172)
  thailand,

  @JsonValue(173)
  timorLeste, // Timor-Leste (East Timor)

  @JsonValue(174)
  togo,

  @JsonValue(175)
  tonga,

  @JsonValue(176)
  trinidadAndTobago,

  @JsonValue(177)
  tunisia,

  @JsonValue(178)
  turkey,

  @JsonValue(179)
  turkmenistan,

  @JsonValue(180)
  tuvalu,

  @JsonValue(181)
  uganda,

  @JsonValue(182)
  ukraine,

  @JsonValue(183)
  unitedArabEmirates,

  @JsonValue(184)
  unitedKingdom,

  @JsonValue(185)
  unitedStates,

  @JsonValue(186)
  uruguay,

  @JsonValue(187)
  uzbekistan,

  @JsonValue(188)
  vanuatu,

  @JsonValue(189)
  vaticanCity, // Vatican City (Holy See)

  @JsonValue(190)
  venezuela,

  @JsonValue(191)
  vietnam,

  @JsonValue(192)
  yemen,

  @JsonValue(193)
  zambia,

  @JsonValue(194)
  zimbabwe,
}
