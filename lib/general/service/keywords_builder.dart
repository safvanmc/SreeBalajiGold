class KeywordsBuilder {
static List<String> keywordsBuilder(String caseNumber) {
  List<String> caseSearchList = <String>[];
  String temp = "";

  List<String> nameSplits = caseNumber.split(" ");
  for (int i = 0; i < nameSplits.length; i++) {
    String name = "";

    for (int k = i; k < nameSplits.length; k++) {
      name = "$name${nameSplits[k]} ";
    }
    temp = "";

    for (int j = 0; j < name.length; j++) {
      temp = temp + name[j];
      caseSearchList.add(temp.toLowerCase().replaceAll(" ",""));
    }
  }
  return caseSearchList.toSet().toList();
}

  // convertName Contains space
  // then split the string and add to the list
  // then return the list

 static  List<String> advanceKeywordsBuilder(String convertName) {
    final filteredKeyword =
        convertName.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
    List<String> words = filteredKeyword.split(" ");
    List<String> substrings = [];
    for (String word in words) {
      String currentSubstring = "";
      for (int i = 0; i < word.length; i++) {
        currentSubstring += word[i];
        substrings.add(currentSubstring.toLowerCase());
      }
      substrings.add(word.toLowerCase());
    }
    if (!words.contains("")) {
      substrings.add(filteredKeyword.replaceAll(' ', '').toLowerCase());
    }
    substrings = substrings.toSet().toList();
    substrings.remove('');
    substrings.sort();

    return substrings;
  }
}
