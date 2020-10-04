class Utils {
  String getFormattedUrlWithId(List list, String type) {
    if (list.isNotEmpty) {
      String formattedUrl = '';
      if (type == 'character') {
        formattedUrl = 'https://rickandmortyapi.com/api/character/';
      } else if (type == 'episode') {
        formattedUrl = 'https://rickandmortyapi.com/api/episode/';
      } else {
        formattedUrl = 'https://rickandmortyapi.com/api/location/';
      }
      list.forEach((l) {
        String id = l.split('/').removeLast();
        if (list.indexOf(l) == 0) {
          formattedUrl = formattedUrl + id;
        } else {
          formattedUrl = formattedUrl + ',$id';
        }
      });
      return formattedUrl;
    }
    return '';
  }
}
