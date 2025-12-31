import Toybox.Lang;

module StringUtils {

    function split(string as String, separator as String) as Array<String> {
        var result = [] as Array<String>;
        while (string.length() > 0) {
            var index = string.find(separator);
            if (index == null) {
                result.add(string);
                break;
            } else {
                result.add(string.substring(0, index));
                string = string.substring(index + separator.length(), string.length());
            }
        }
        return result;
    }

}

// TODO: implement tests