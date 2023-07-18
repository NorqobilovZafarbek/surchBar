import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  List<String> lists = [
    "Andorra",
    "United Arab Emirates",
    "Afghanistan",
    "Antigua and Barbuda",
    "Anguilla",
    "Albania",
    "Armenia",
    "Angola",
    "Antarctica",
    "Argentina",
    "American Samoa",
    "Austria",
    "Australia",
    "Aruba",
    "Åland Islands",
    "Azerbaijan",
    "Bosnia and Herzegovina",
    "Barbados",
    "Bangladesh",
    "Belgium",
    "Burkina Faso",
    "Bulgaria",
    "Bahrain",
    "Burundi",
    "Benin",
    "Saint Barthélemy",
    "Bermuda",
    "Brunei Darussalam",
    "Bolivia, Plurinational State of",
    "Bonaire, Sint Eustatius and Saba",
    "Brazil",
    "Bahamas",
    "Bhutan",
    "Bouvet Island",
    "Botswana",
    "Belarus",
    "Belize",
    "Canada",
    "Cocos (Keeling) Islands",
    "Congo, the Democratic Republic of the",
    "Central African Republic",
    "Congo",
    "Switzerland",
    "Côte d'Ivoire",
    "Cook Islands",
    "Chile",
    "Cameroon",
    "China",
    "Colombia",
    "Costa Rica",
    "Cuba",
    "Cape Verde",
    "Curaçao",
    "Christmas Island",
    "Cyprus",
    "Czech Republic",
    "Germany",
    "Djibouti",
    "Denmark",
    "Dominica",
    "Dominican Republic",
    "Algeria",
    "Ecuador",
    "Estonia",
    "Egypt",
    "Western Sahara",
    "Eritrea",
    "Spain",
    "Ethiopia",
    "Finland",
    "Fiji",
    "Falkland Islands (Malvinas)",
    "Micronesia, Federated States of",
    "Faroe Islands",
    "France",
    "Gabon",
    "United Kingdom",
    "Grenada",
    "Georgia",
    "French Guiana",
    "Guernsey",
    "Ghana",
    "Gibraltar",
    "Greenland",
    "Gambia",
    "Guinea",
    "Guadeloupe",
    "Equatorial Guinea",
    "Greece",
    "South Georgia and the South Sandwich Islands",
    "Guatemala",
    "Guam",
    "Guinea-Bissau",
    "Guyana",
    "Hong Kong",
    "Heard Island and McDonald Islands",
    "Honduras",
    "Croatia",
    "Haiti",
    "Hungary",
    "Indonesia",
    "Ireland",
    "Israel",
    "Isle of Man",
    "India",
    "British Indian Ocean Territory",
    "Iraq",
    "Iran, Islamic Republic of",
    "Iceland",
    "Italy",
    "Jersey",
    "Jamaica",
    "Jordan",
    "Japan",
    "Kenya",
    "Kyrgyzstan",
    "Cambodia",
    "Kiribati",
    "Comoros",
    "Saint Kitts and Nevis",
    "Korea, Democratic People's Republic of",
    "Korea, Republic of",
    "Kuwait",
    "Cayman Islands",
    "Kazakhstan",
    "Lao People's Democratic Republic",
    "Lebanon",
    "Saint Lucia",
    "Liechtenstein",
    "Sri Lanka",
    "Liberia",
    "Lesotho",
    "Lithuania",
    "Luxembourg",
    "Latvia",
    "Libyan Arab Jamahiriya",
    "Morocco",
    "Monaco",
    "Moldova, Republic of",
    "Montenegro",
    "Saint Martin (French part)",
    "Madagascar",
    "Marshall Islands",
    "Macedonia, the former Yugoslav Republic of",
    "Mali",
    "Myanmar",
    "Mongolia",
    "Macao",
    "Northern Mariana Islands",
    "Martinique",
    "Mauritania",
    "Montserrat",
    "Malta",
    "Mauritius",
    "Maldives",
    "Malawi",
    "Mexico",
    "Malaysia",
    "Mozambique",
    "Namibia",
    "New Caledonia",
    "Niger",
    "Norfolk Island",
    "Nigeria",
    "Nicaragua",
    "Netherlands",
    "Norway",
    "Nepal",
    "Nauru",
    "Niue",
    "New Zealand",
    "Oman",
    "Panama",
    "Peru",
    "French Polynesia",
    "Papua New Guinea",
    "Philippines",
    "Pakistan",
    "Poland",
    "Saint Pierre and Miquelon",
    "Pitcairn",
    "Puerto Rico",
    "Palestinian Territory, Occupied",
    "Portugal",
    "Palau",
    "Paraguay",
    "Qatar",
    "Réunion",
    "Romania",
    "Serbia",
    "Russian Federation",
    "Rwanda",
    "Saudi Arabia",
    "Solomon Islands",
    "Seychelles",
    "Sudan",
    "Sweden",
    "Singapore",
    "Saint Helena, Ascension and Tristan da Cunha",
    "Slovenia",
    "Svalbard and Jan Mayen",
    "Slovakia",
    "Sierra Leone",
    "San Marino",
    "Senegal",
    "Somalia",
    "Suriname",
    "Sao Tome and Principe",
    "El Salvador",
    "Sint Maarten (Dutch part)",
    "Syrian Arab Republic",
    "Swaziland",
    "Turks and Caicos Islands",
    "Chad",
  ];

  ValueNotifier<Set<String>> chipsItems = ValueNotifier(<String>{});

  @override
  List<Widget>? buildActions(BuildContext context) {
    CloseButton();
  }

  @override
  Widget? buildLeading(BuildContext context) => BackButton();

  @override
  Widget buildResults(BuildContext context) {
    String res = query;
    return ListTile(
      title: Text(res),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> result = [];
    if (query.isNotEmpty) {
      result = lists
          .where(
            (e) => e.toLowerCase().startsWith(query.trim().toLowerCase()),
          )
          .toList(
            growable: false,
          );
    } else {
      result = lists;
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = result[index];
            Set<String> res = chipsItems.value.toSet();
            res.add(result[index]);
            chipsItems.value = res;
            query = "";
          },
          title: Text(result[index]),
        );
      },
      itemCount: result.length,
    );
  }

  PreferredSizeWidget buildBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 150),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: ListView(
          children: [
            ValueListenableBuilder(
              valueListenable: chipsItems,
              builder: (context, value, child) {
                return Wrap(
                  children: List.generate(
                    value.length,
                    (index) => InputChip(
                      label: Text(
                        value.elementAt(index),
                      ),
                      onDeleted: () {
                        Set<String> res = chipsItems.value.toSet();
                        res.removeWhere(
                              (e) => e == chipsItems.value.elementAt(index),
                        );
                        chipsItems.value = res;
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
